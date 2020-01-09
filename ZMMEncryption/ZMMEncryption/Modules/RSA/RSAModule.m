//
//  RSAModule.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "RSAModule.h"
#import "ZMMSecurityUtil.h"

@implementation RSAModule

#pragma mark - Public
+ (NSString *)getModuleID
{
    return NSStringFromClass([self class]);
}

- (void)executeTheTestCode
{
    NSString *str = @"3431410491094017401249017410041";
    NSString *encrptionString = securityUtil.RSAEncryptString(str);
    NSLog(@"RSA加密后的字符串%@",encrptionString);
}

@end
