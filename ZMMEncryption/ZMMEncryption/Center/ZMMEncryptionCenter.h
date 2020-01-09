//
//  ZMMEncryptionCenter.h
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * _Nonnull const kModuleClassNameKey;

NS_ASSUME_NONNULL_BEGIN

@interface ZMMEncryptionCenter : NSObject

+ (ZMMEncryptionCenter *)sharedCenter;

/// 注册所有的Module
/// @param aModules 数组
- (BOOL)registerAllModule:(NSArray <NSDictionary *> *)aModules;

/// 查找对应的module
/// @param moduleId moduleID
- (void)executeTheTestCodeWithModuleID:(NSString *)moduleId;

@end

NS_ASSUME_NONNULL_END
