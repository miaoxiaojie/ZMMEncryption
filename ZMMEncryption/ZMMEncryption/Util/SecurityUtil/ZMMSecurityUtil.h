//
//  ZMMSecurityUtil.h
//  ZMMEncryption
//
//  Created by miao on 2020/1/7.
//  Copyright © 2020 zmm. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const struct ZMMSecurityUtil
{
    //RSA加密 获得字符串
    NSString *(*RSAEncryptString)(NSString *str);
    //RSA加密 获得NSData
    NSData *(*RSAEncryptStringResultsData)(NSString *str);
    //获取RSA公钥
    SecKeyRef (*SecKeyRefCopyPublicKey)(void);
    //RSA加密
    NSData *(*encryptString)(NSString *inString,SecKeyRef keyRef,NSError **err);

   
}securityUtil;
