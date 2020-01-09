//
//  ZMMFileUtil.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/7.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "ZMMFileUtil.h"

@implementation ZMMFileUtil

+ (NSString *)getLocalFilePath
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ReadMe" ofType:@"txt"];
    return filePath;
}

+ (NSString *)getSandboxPath
{
    NSString *dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).firstObject;
    dirPath = [dirPath stringByAppendingPathComponent:@"ReadMe.txt"];
    return dirPath;
}

+ (BOOL)fileCopy:(NSString *)fromPath toPath:(NSString *)toPath

{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:toPath])
    {
        [fileManager removeItemAtPath:toPath error:nil];
    }
    
    BOOL copySuccess = [fileManager copyItemAtPath:fromPath
                                            toPath:toPath
                                             error:nil];
    return copySuccess;
}

+ (BOOL)writeToFile:(NSString *)path data:(NSString *)data
{
    BOOL writeSuccess = [data writeToFile:path
                               atomically:YES
                                 encoding:NSUTF8StringEncoding
                                    error:nil];
                         
    return writeSuccess;
}

@end
