//
//  NSString+Transfor.h
//  ZMMEncryption
//
//  Created by miao on 2019/12/31.
//  Copyright © 2019 zmm. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Transfor)

/// 16 进制字符串转换成 String
/// @param hexString 16进制字符串
- (nullable NSString *)convertStringFromHexString:(NSString *)hexString;

/// md5 加密
- (NSString *)md5_32bit;

/// 获取文件的md5值
/// @param path 文件路径
/// @return 32位字符串
+ (NSString *)getFileSHA256WithPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
