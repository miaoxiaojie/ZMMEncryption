//
//  NSData+Transfor.m
//  ZMMEncryption
//
//  Created by miao on 2020/1/4.
//  Copyright © 2020 zmm. All rights reserved.
//

#import "NSData+Transfor.h"


@implementation NSData (Transfor)


+ (nullable NSString *)convertStringFromData:(NSData *)data
{
    if(!data){
        return nil;
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];

    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];

    return [string copy];
}


@end
