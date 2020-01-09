//
//  ZMMFileUtil.h
//  ZMMEncryption
//
//  Created by miao on 2020/1/7.
//  Copyright © 2020 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMMFileUtil : NSObject

/// 本地文件ReadMe路径
+ (NSString *)getLocalFilePath;

/// 沙盒文件路径
+ (NSString *)getSandboxPath;

/// 将fromPath源文件拷贝到toPath路径下
/// @param fromPath 源文件路径
/// @param toPath 目标文件路径
+ (BOOL)fileCopy:(NSString *)fromPath toPath:(NSString *)toPath;

/// 将data数据写入到path路径下
/// @param path 目标文件路径
/// @param data 数据
+ (BOOL)writeToFile:(NSString *)path data:(NSString *)data;

@end

NS_ASSUME_NONNULL_END
