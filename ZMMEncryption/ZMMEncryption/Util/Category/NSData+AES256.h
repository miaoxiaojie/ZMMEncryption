//
//  NSData+AES256.h
//  ZMMEncryption
//
//  Created by miao on 2019/12/31.
//  Copyright © 2019 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (AES256)

/// AES加密 使用AES256加密
/// @param originData 加密前的字符串
/// @param key 秘钥  32位
+ (NSData *)aes256Encryption:(NSData *)originData
                  encryptKey:(NSString *)key;

/// AES解密 使用AES解密
/// @param originData 解密前数据
/// @param key 秘钥 32 位
+ (NSData *)aes256Decryption:(NSData *)originData
                 decryptKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
