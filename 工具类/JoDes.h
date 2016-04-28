//
//  JoDes.h
//  FuCardApp
//
//  Created by 裕福 on 15/1/27.
//  Copyright (c) 2015年 Victor. All rights reserved.
//
#include <CommonCrypto/CommonCryptor.h>
#import <Foundation/Foundation.h>

@interface JoDes : NSObject

+(NSString *) encode:(NSString *)str key:(NSString *)key;

+(NSString *) decode:(NSString *)str key:(NSString *)key;

+(NSString *) encodeBase64WithString:(NSString *)strData;

+(NSString *) encodeBase64WithData:(NSData *)objData;

+(NSData *) decodeBase64WithString:(NSString *)strBase64;

+(NSString *)doCipher:(NSString *)sTextIn key:(NSString *)sKey
              context:(CCOperation)encryptOrDecrypt;

//16进制字符串转成普通字符串
+ (NSString *)stringFromHexString:(NSString *)hexString;

//16进制字符串转成二进制
+ (NSData *) stringToHexData:(NSString *)hexString;
@end
