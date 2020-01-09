//
//  AppDelegate.m
//  ZMMEncryption
//
//  Created by miao on 2019/12/31.
//  Copyright © 2019 zmm. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ZMMEncryptionCenter.h"
#import "AESModule.h"
#import "RSAModule.h"
#import "AESAndRSAModule.h"
#import "SHA256Module.h"
#import "MD5Module.h"
#import "Base64Module.h"
#import "SHA256BadModule.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (void)load
{
    NSArray *modules = @[
                        @{kModuleClassNameKey:NSStringFromClass([AESModule class])},
                        @{kModuleClassNameKey:NSStringFromClass([RSAModule class])},
                        @{kModuleClassNameKey:NSStringFromClass([AESAndRSAModule class])},
                        @{kModuleClassNameKey:NSStringFromClass([SHA256Module class])},
                        @{kModuleClassNameKey:NSStringFromClass([Base64Module class])},
                        @{kModuleClassNameKey:NSStringFromClass([MD5Module class])},
                        @{kModuleClassNameKey:NSStringFromClass([SHA256BadModule class])},
                        ];
    
    ZMMEncryptionCenter *center = [ZMMEncryptionCenter sharedCenter];
    [center registerAllModule:modules];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self p_loadAppRootViewController];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

-(void)p_loadAppRootViewController
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ViewController *mainVC = [[ViewController alloc] init];
    UINavigationController *entryVC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    self.window.rootViewController = entryVC;
}


@end
