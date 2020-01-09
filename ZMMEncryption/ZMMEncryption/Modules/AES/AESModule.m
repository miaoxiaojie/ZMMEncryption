//
//  AESModule.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "AESModule.h"
#import "ZMMEncryptionModel.h"
#import "NSData+AES256.h"
#import "NSData+Transfor.h"

@implementation AESModule

+ (NSString *)getModuleID
{
    return NSStringFromClass([self class]);
}

- (void)executeTheTestCode
{
    //秘钥
    NSString *AESKeyString = [ZMMEncryptionModel getAES256EncryptKey];
    //手机号
    NSString *phone = [ZMMEncryptionModel getNeedEncryptedPhone];
    //手机号转化为NSData
    NSData *phoneData = [phone dataUsingEncoding:NSUTF8StringEncoding];
    //手机号加密过后的NSData
    NSData *AESPhEnAfterData = [NSData aes256Encryption:phoneData encryptKey:AESKeyString];
    //加密后得到的数据转换为16进制字符串，传给服务器
    NSString *passToServer = [NSData convertStringFromData:AESPhEnAfterData];
    //使用AES解密之后的数据
    NSData *AESPhDecAfterData = [NSData aes256Decryption:AESPhEnAfterData
                                              decryptKey:AESKeyString];
    //解密之后转化为字符串
    NSString *result = [[NSString alloc] initWithData:AESPhDecAfterData
                                             encoding:NSUTF8StringEncoding];
  NSLog(@"需要AES加密的手机号=%@\n手机号加密过后的NSData=%@\n加密后得到的数据转换为16进制字符串，传给服务器=%@\n使用AES解密之后的数据=%@\n解密之后转化为字符串=%@\n",phone,AESPhEnAfterData,passToServer,AESPhDecAfterData,result);
}

@end
