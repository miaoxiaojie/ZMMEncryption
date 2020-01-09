//
//  ZMMBase64.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/3.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "ZMMBase64.h"

@implementation ZMMBase64

+ (nullable NSString *)decodeString:(NSString *)string {
    
    if (!string) {
        return nil;
    }
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    if (data) {
        return [[NSString alloc]initWithData:data
                                    encoding:NSUTF8StringEncoding];;
    }
    
    return nil;
}

+ (nullable NSData *)decodeData:(NSString *)string {
    if (!string) {
        
        return nil;
    }
    NSData *aData = [[NSData alloc]initWithBase64EncodedString:string options:0];
    return aData;
}

+ (nullable NSString *)encodeString:(NSString *)string
{
    if (!string) {
        return nil;
    }
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
        return [data base64EncodedStringWithOptions:0];
    }
    return nil;
}

+ (nullable NSString *)encodeStringWithData:(NSData *)aData
{
    if (!aData) {
        return nil;
    }
    aData = [aData base64EncodedDataWithOptions:0];
    return [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
}

@end
