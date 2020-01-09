//
//  SHA256Module.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "SHA256Module.h"
#import "ZMMFileUtil.h"
#import "NSString+AES256.h"
#import "NSString+Transfor.h"

@implementation SHA256Module


#pragma mark - Public
+ (NSString *)getModuleID
{
    return NSStringFromClass([self class]);
}

- (void)executeTheTestCode
{
    /*
     1.本地文件
     2.沙盒文件：把本地文件拷贝到沙盒文件
     3.比较本地文件路径加密后字符串与沙盒文件路径加密后的字符串
     4.查看文件是否被损坏
     */
    //本地文件
    NSString *filePath = [ZMMFileUtil getLocalFilePath];
    //本地文件加密SHA256
    NSString *localSHA256 = [NSString getFileSHA256WithPath:filePath];
    //沙盒文件的路径
    NSString *dirPath = [ZMMFileUtil getSandboxPath];
    //把文件拷贝到沙盒
    BOOL copySuccess = [ZMMFileUtil fileCopy:filePath toPath:dirPath];
    NSString *dirSHA256 = [NSString getFileSHA256WithPath:dirPath];
    if ([dirSHA256 isEqualToString:localSHA256]) {
        NSLog(@"文件没有被损坏");
    }
}

@end
