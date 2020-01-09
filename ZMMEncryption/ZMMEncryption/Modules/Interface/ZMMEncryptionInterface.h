//
//  ZMMEncryptionInterface.h
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZMMEncryptionInterface <NSObject>

/// 获得Module 的标识
+ (NSString *)getModuleID;

/// 执行代码
- (void)executeTheTestCode;

@end

NS_ASSUME_NONNULL_END
