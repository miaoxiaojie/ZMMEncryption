//
//  SHA256BadModule.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "SHA256BadModule.h"
#import "ZMMFileUtil.h"
#import "NSString+AES256.h"
#import "NSString+Transfor.h"

@implementation SHA256BadModule

#pragma mark - Public
+ (NSString *)getModuleID
{
    return NSStringFromClass([self class]);
}

- (void)executeTheTestCode
{
    //本地文件
    NSString *filePath = [ZMMFileUtil getLocalFilePath];
    //本地文件加密SHA256
    NSString *localSHA256 = [NSString getFileSHA256WithPath:filePath];
    //沙盒文件的路径
    NSString *dirPath = [ZMMFileUtil getSandboxPath];
    //破坏文件
    BOOL damage = [ZMMFileUtil writeToFile:filePath data:@"破坏文件"];
    //把文件拷贝到沙盒
    BOOL copySuccess = [ZMMFileUtil fileCopy:filePath toPath:dirPath];
    NSString *dirSHA256 = [NSString getFileSHA256WithPath:dirPath];
    if (![dirSHA256 isEqualToString:localSHA256]) {
        NSLog(@"文件被损坏");
        
    }
}


@end
