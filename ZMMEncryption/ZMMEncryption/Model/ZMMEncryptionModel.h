//
//  ZMMEncryptionModel.h
//  ZMMEncryption
//
//  Created by miao on 2020/1/3.
//  Copyright © 2020 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

// module id
extern NSString * _Nonnull const kModuleID;
// cell title
extern NSString * _Nonnull const kCellTitle;

NS_ASSUME_NONNULL_BEGIN

@interface ZMMEncryptionModel : NSObject

+ (NSString *)getAES256EncryptKey;

+ (NSString *)getNeedEncryptedPhone;

/// 获得加密文件
+ (NSString *)getFileSHA256;

+ (NSData *)getNeedAES256Data;

//获得tableView数据
+ (NSArray <NSDictionary *> *)getUITableViewData;

@end

NS_ASSUME_NONNULL_END
