//
//  Base64Module.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "Base64Module.h"
#import "ZMMEncryptionModel.h"
#import "ZMMBase64.h"

@implementation Base64Module


#pragma mark - Public
+ (NSString *)getModuleID
{
    return NSStringFromClass([self class]);
}

- (void)executeTheTestCode
{
    NSString *originString = [ZMMEncryptionModel getAES256EncryptKey];
    NSString *base64En = [ZMMBase64 encodeString:originString];
    NSString *base64Dec = [ZMMBase64 decodeString:base64En];
    NSLog(@"原始数据=%@\n,编码后的数据=%@\n,解码后的数据=%@",originString,base64En,base64Dec);
}

@end
