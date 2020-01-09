//
//  AESAndRSAModule.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "AESAndRSAModule.h"
#import "ZMMEncryptionModel.h"
#import "NSData+AES256.h"
#import "NSData+Transfor.h"
#import "ZMMSecurityUtil.h"

@implementation AESAndRSAModule


#pragma mark - Public
+ (NSString *)getModuleID
{
    return NSStringFromClass([self class]);
}

- (void)executeTheTestCode
{
    //1.获取AES的秘钥
    NSString *AESKeyString = [ZMMEncryptionModel getAES256EncryptKey];
    //2.把AES的秘钥使用RSA加密
    NSData *encrptionData = securityUtil.RSAEncryptStringResultsData(AESKeyString);
    //3.把RSA加密过的AES的秘钥转化16进制字符串
    NSString *encryptKey = [NSData convertStringFromData:encrptionData];
    //4.需要加密的数据
    NSData *needEncrptionData = [ZMMEncryptionModel getNeedAES256Data];
    //5.AES加密过的数据
    NSData *AESPhEnAfterData = [NSData aes256Encryption:needEncrptionData encryptKey:encryptKey];
    //6.把AES加密过的数据 和秘钥 拼接字符串传给服务端
    NSString *reslut = [NSString stringWithFormat:@"%@,%@",AESPhEnAfterData,encryptKey];
    NSLog(@"传给服务端的数据%@",reslut);
}

@end
