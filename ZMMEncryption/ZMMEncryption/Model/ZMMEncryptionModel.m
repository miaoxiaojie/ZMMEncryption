//
//  ZMMEncryptionModel.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/3.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "ZMMEncryptionModel.h"
#import "NSString+Transfor.h"
#import "ZMMBase64.h"
#import "AESModule.h"
#import "RSAModule.h"
#import "AESAndRSAModule.h"
#import "SHA256Module.h"
#import "MD5Module.h"
#import "Base64Module.h"
#import "SHA256BadModule.h"

NSString *const kModuleID = @"moduleID";
NSString *const kCellTitle = @"title";

//AES 秘钥 字符串@"ZWCXQMeco6sdscQEF09"
static NSString *const kAES256EncryptKey = @"ZWCXQMeco6sdscQEF09";
//手机号
static NSString *const kPhone = @"18838731772";
//本地文件路径加密
static NSString *const kFileSHA256 = @"8bcc38b6d83cd805edd00b3b07531a6840aa5d95b398847107d8a971";

@implementation ZMMEncryptionModel

+ (NSString *)getAES256EncryptKey
{
    return kAES256EncryptKey;
}

+ (NSString *)getNeedEncryptedPhone
{
    return kPhone;
}

+ (NSString *)getFileSHA256
{
    return kFileSHA256;
}

+ (NSData *)getNeedAES256Data
{
    NSString *str = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANNtnpw0f0+B0XrRpAq94vPcVNqXLMdDBunrTXLvtLOYYdfcXk2hVRlt0rtQx2gIsrgUHOJN7BgP0Na8AStdmj0EW4j3psCinzB+XVWRnLIdNzOfE0kUZJB38HvT8TEyAwGkTCQAB3JSoiMh1UaHUVAr/hpzBLf1hfBtL4iUew9JAgMBAAECgYA1tGeQmAkqofga8XtwuxEWDoaDS9k0+EKeUoXGxzqoT/GyiihuIafjILFhoUA1ndf/yCQaG973sbTDhtfpMwqFNQq13+JAownslTjWgr7Hwf7qplYW92R7CU0v7wFfjqm1t/2FKU9JkHfaHfb7qqESMIbO/VMjER9o4tEx58uXDQJBAO0O4lnWDVjr1gN02cqvxPOtTY6DgFbQDeaAZF8obb6XqvCqGW/AVms3Bh8nVlUwdQ2K/xte8tHxjW9FtBQTLd8CQQDkUncO35gAqUF9Bhsdzrs7nO1J3VjLrM0ITrepqjqtVEvdXZc+1/UrkWVaIigWAXjQCVfmQzScdbznhYXPz5fXAkEAgB3KMRkhL4yNpmKRjhw+ih+ASeRCCSj6Sjfbhx4XaakYZmbXxnChg+JB+bZNz06YBFC5nLZM7y/n61o1f5/56wJBALw+ZVzE6ly5L34114uG04W9x0HcFgau7MiJphFjgUdAtd/H9xfgE4odMRPUD3q9Me9LlMYK6MiKpfm4c2+3dzcCQQC8y37NPgpNEkd9smMwPpSEjPW41aMlfcKvP4Da3z7G5bGlmuICrva9YDAiaAyDGGCK8LxC8K6HpKrFgYrXkRtt";
    
    return [ZMMBase64 decodeData:str];
}

+ (NSArray <NSDictionary *> *)getUITableViewData
{
    
    return @[@{kModuleID:NSStringFromClass([AESModule class]),kCellTitle:@"AES加密算法"},
             @{kModuleID:NSStringFromClass([RSAModule class]),kCellTitle:@"RSA加密算法"},
             @{kModuleID:NSStringFromClass([AESAndRSAModule class]),kCellTitle:@"AES+RSA混合加密"},
             @{kModuleID:NSStringFromClass([Base64Module class]),kCellTitle:@"base64加密"},
             @{kModuleID:NSStringFromClass([MD5Module class]),kCellTitle:@"MD5加密"},
             @{kModuleID:NSStringFromClass([SHA256Module class]),kCellTitle:@"SHA256检验文件完成性(文件没有被损坏)"},
             @{kModuleID:NSStringFromClass([SHA256BadModule class]),kCellTitle:@"SHA256检验文件完成性(文件被损坏)"},
            ];
}

@end
