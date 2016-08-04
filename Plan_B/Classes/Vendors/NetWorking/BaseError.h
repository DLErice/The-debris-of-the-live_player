//
//  BaseError.h
//  OneTargetGClient
//
//  Created by DLErice on 3/8/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Error Domain

#define kERROR_DOMAIN_OneTarget @"OneTargetDomainError"

#pragma mark - Error Code

#define kErrorCodeOffset        600 // Out of HTTP status code range

typedef NS_ENUM (NSUInteger, ErrorCode) {
    ErrorCodeNone,
    ErrorCodeNetwork = kErrorCodeOffset,
    ErrorCodeConversion,
    ErrorCodeJSONModelConversion,
    ErrorCodeServerLogic
};

#define IsInternalError(__error) (((__error).code >= kErrorCodeOffset) ? YES : NO)

#pragma mark - Macros

#define OTError(__code, __underlying_message, __readable_message)      \
    [NSError errorWithDomain : kERROR_DOMAIN_OneTarget code : (__code) \
     userInfo : @{ NSUnderlyingErrorKey : (__underlying_message),      \
                   NSLocalizedDescriptionKey : (__readable_message) }]


#define OTError_Network             OTError(ErrorCodeNetwork, @"Bad network or request task is invalid!", @"网络请求失败!")
#define OTError_Conversion          OTError(ErrorCodeConversion, @"Convert data type failed!", @"数据处理错误!")
#define OTError_JSONModelConversion OTError(ErrorCodeJSONModelConversion, @"Convert data failed in JSONModel!", @"数据转换错误!")
#define OTError_ServerLogic         OTError(ErrorCodeServerLogic, @"The task is failed in server side with some logic issues!", @"操作失败!")
