//
//  ZMMEncryptionCenter.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/8.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "ZMMEncryptionCenter.h"
#import "ZMMEncryptionInterface.h"

NSString *const kModuleClassNameKey = @"className";

@interface ZMMEncryptionCenter ()

/// modules
@property (strong,nonatomic) NSMutableArray <id<ZMMEncryptionInterface>> *modules;

@end

@implementation ZMMEncryptionCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modules = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

+ (ZMMEncryptionCenter *)sharedCenter
{
   static dispatch_once_t once;
    static ZMMEncryptionCenter *center = nil;
    dispatch_once(&once, ^{
        center = [[ZMMEncryptionCenter alloc] init];
    });
    return center;
}

- (BOOL)registerAllModule:(NSArray <NSDictionary *> *)aModules
{
    for (NSDictionary *itemDict in aModules) {
        NSString *className = [itemDict objectForKey:kModuleClassNameKey];
        id<ZMMEncryptionInterface> module = [[NSClassFromString(className) alloc] init];
        if ([module conformsToProtocol:@protocol(ZMMEncryptionInterface)]) {
            [self.modules addObject:module];
        }
        
    }
    
    return YES;
}

- (void)executeTheTestCodeWithModuleID:(NSString *)moduleId
{
    for (id<ZMMEncryptionInterface> module in self.modules) {
        NSString *findModuleID = [[module class] getModuleID];
        if ([findModuleID isEqualToString:moduleId]) {
            [module executeTheTestCode];
        }
    }
}

@end
