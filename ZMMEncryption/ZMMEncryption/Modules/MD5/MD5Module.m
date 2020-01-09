//
//  MD5Module.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "MD5Module.h"
#import "NSString+Transfor.h"

@implementation MD5Module


#pragma mark - Public
+ (NSString *)getModuleID
{
    return NSStringFromClass([self class]);
}

- (void)executeTheTestCode
{
    //手机号
    NSString *phone = @"12";
    // MD5 加密
    NSString *md5Phone = [phone md5_32bit];
    NSLog(@"原始数据=%@\nMD5加密过后的数据=%@\n",phone,md5Phone);
}

@end
