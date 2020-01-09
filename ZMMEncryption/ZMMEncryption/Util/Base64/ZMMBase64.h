//
//  ZMMBase64.h
//  ZMMEncryption
//
//  Created by miao on 2020/1/3.
//  Copyright © 2020 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMMBase64 : NSObject


/// base64解码
/// @param string base64编码后的字符串
+ (nullable NSString *)decodeString:(NSString *)string;

/// base64解码
/// @param string base64编码后的字符串
+ (nullable NSData *)decodeData:(NSString *)string;

/// base64编码
/// @param string 字符串
+ (nullable NSString *)encodeString:(NSString *)string;

///base64编码
/// @param aData data
+ (nullable NSString *)encodeStringWithData:(NSData *)aData;

@end

NS_ASSUME_NONNULL_END
