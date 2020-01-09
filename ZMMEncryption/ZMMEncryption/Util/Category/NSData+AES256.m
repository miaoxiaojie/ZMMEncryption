//
//  NSData+AES256.m
//  ZMMEncryption
//
//  Created by miao on 2019/12/31.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "NSData+AES256.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


@implementation NSData (AES256)

+ (NSData *)aes256Encryption:(NSData *)originData
                  encryptKey:(NSString *)key
{
    if (!originData || !key) {
        return nil;
    }
     char keyPtr[kCCKeySizeAES256 + 1];
        bzero(keyPtr, sizeof(keyPtr));
        [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
        
        NSUInteger dataLength = [originData length];
        size_t bufferSize = dataLength + kCCBlockSizeAES128;
        void *buffer = malloc(bufferSize);
        size_t numBytesEncrypted = 0;
        CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [originData bytes], dataLength, buffer, bufferSize, &numBytesEncrypted);
        
        if (cryptStatus == kCCSuccess) {
            
            return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        }
        
        free(buffer);
        return nil;
}

+ (NSData *)aes256Decryption:(NSData *)originData
                 decryptKey:(NSString *)key
{
    if (!originData || !key) {
        return nil;
    }
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [originData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [originData bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        
    }
    free(buffer);
    return nil;
}

@end
