//
//  NSData+Transfor.h
//  ZMMEncryption
//
//  Created by miao on 2020/1/4.
//  Copyright © 2020 zmm. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Transfor)


/// 将NSData 转化为16进制的字符串
/// @param data NSData
+ (nullable NSString *)convertStringFromData:(NSData *)data;


@end

NS_ASSUME_NONNULL_END
