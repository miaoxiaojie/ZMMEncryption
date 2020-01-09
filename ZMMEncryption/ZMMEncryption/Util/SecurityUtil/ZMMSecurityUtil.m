//
//  ZMMSecurityUtil.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/7.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "ZMMSecurityUtil.h"
#import "ZMMBase64.h"

#define RSAPublicFileName @"公钥文件名"
#define RSAPublicFileType @"公钥文件类型"

static NSString *RSAEncryptString(NSString *str)
{
    SecKeyRef key = securityUtil.SecKeyRefCopyPublicKey();
    NSError *error = nil;
    NSString *result = nil;
    if (key!=NULL) {
        NSData *data = securityUtil.encryptString(str,key,&error);
        result = [ZMMBase64 encodeStringWithData:data];
        CFRelease(key);
    }
    if (!result) {
        return nil;
    }
    return result;
}

static NSData *RSAEncryptStringResultsData(NSString *str)
{
    SecKeyRef key = securityUtil.SecKeyRefCopyPublicKey();
    NSError *error = nil;
    NSData *reslut = nil;
    if (key!=NULL) {
        reslut = securityUtil.encryptString(str,key,&error);
        CFRelease(key);
    }
    if (!reslut) {
        return nil;
    }
    return reslut;
}

static SecKeyRef SecKeyRefCopyPublicKey()
{
    NSString *certPath = [[NSBundle mainBundle] pathForResource:RSAPublicFileName ofType:RSAPublicFileType];
    NSData *certData = [[NSData alloc] initWithContentsOfFile:certPath];
    if (!certData) {
        return nil;
    }
    SecCertificateRef cert = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge CFDataRef)certData);
    CFArrayRef certs = CFArrayCreate(kCFAllocatorDefault, (const void **)&cert, 1, NULL);
    SecTrustRef trust = NULL;
    SecKeyRef pub_key_leaf = NULL;
    SecPolicyRef policy = NULL;
    if (certs != NULL) {
        policy = SecPolicyCreateBasicX509();
        SecTrustCreateWithCertificates(certs, policy, &trust);
        CFErrorRef *trustResult = NULL;
        if (SecTrustEvaluateWithError(trust, trustResult) == noErr) {
            pub_key_leaf = SecTrustCopyPublicKey(trust);
        }
    }
    
    if (cert != NULL) {
        CFRelease(cert);
    }
    if (certs != NULL) {
        CFRelease(certs);
    }
    if (trust != NULL) {
        CFRelease(trust);
    }
    if (policy != NULL) {
        CFRelease(policy);
    }
    return pub_key_leaf;
}



static NSData *encryptString(NSString *inString,SecKeyRef keyRef,NSError **err)
{
    size_t cipherBufferSize = SecKeyGetBlockSize(keyRef);
    uint8_t *cipherBuffer = malloc(cipherBufferSize * sizeof(uint8_t));
    NSData *stringBytes = [inString dataUsingEncoding:NSUTF8StringEncoding];
    NSInteger blockSize = cipherBufferSize - 11;
    NSInteger blockCount = (NSInteger)ceil([stringBytes length] / (double)blockSize);
    NSMutableData *encryptedData = [[NSMutableData alloc] init];
    for (NSInteger i=0; i<blockCount; i++) {
        NSInteger bufferSize = MIN(blockSize,[stringBytes length]-i * blockSize);
        NSData *buffer = [stringBytes subdataWithRange:NSMakeRange(i * blockSize, bufferSize)];
        OSStatus status = SecKeyEncrypt(keyRef,
                                        kSecPaddingPKCS1,
                                        (const uint8_t *)[buffer bytes],
                                        [buffer length],
                                        cipherBuffer,
                                        &cipherBufferSize);
        if (status == noErr)
        {
            NSData *encryptedBytes = [[NSData alloc]
                                      initWithBytes:(const void *)cipherBuffer
                                      length:cipherBufferSize];
            [encryptedData appendData:encryptedBytes];
        }
        else
        {
            if (err) {
                *err = [NSError errorWithDomain:@"fail" code:status userInfo:nil];
            }
            
            (void)(free(cipherBuffer));
            if (keyRef) {
                CFRelease(keyRef);
            }
            return nil;
        }
    }
    (void)(free(cipherBuffer));
    if (keyRef) {
        CFRelease(keyRef);
    }
    return encryptedData;
}



const struct ZMMSecurityUtil securityUtil = {
    
    .SecKeyRefCopyPublicKey = SecKeyRefCopyPublicKey,
    .RSAEncryptString = RSAEncryptString,
    .encryptString = encryptString,
    .RSAEncryptStringResultsData = RSAEncryptStringResultsData,

};
