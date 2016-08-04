//
//  NSData+Encryption.h
//  OneTargetCommon
//
//  Created by DLErice on 2/26/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encryption)

/**
 *    @brief  encrypt/decrypt method doesn't have Base64 encode/decode within its implementation but you need it manually alone!
 *          Besides, iv (initialization vector) is ignored here.
 *
 */
- (NSData *)encryptAES128WithKey:(NSString *)key;
- (NSData *)decryptAES128WithKey:(NSString *)key;

@end
