//
//  NetworkCenter.h
//  OneTargetGClient
//
//  Created by DLErice on 2/24/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

#define kFuckingRequestRelativeURLPrefix @"yitaifront/"


typedef NS_ENUM (NSInteger, HTTPMethod) {
    HTTPMethodGet,
    HTTPMethodPost,
    HTTPMethodPut,
    HTTPMethodDelete
};

typedef NS_ENUM (NSInteger, NetworkRequestProgress) {
    NetworkRequestProgressStart,
    NetworkRequestProgressOngoing,
    NetworkRequestProgressFinished
};

typedef void (^NetworkRequestCompletion)(BaseResponse *_Nullable, NSError *_Nullable error);


/**
 *    @brief  Security Code is used for encrypt login request.
 */
NSString * _Nonnull GetSecurityCode();


@protocol NetworkCenterDelegate <NSObject>

- (void)networkRequestProgress:(NetworkRequestProgress)progressOption progress:(NSProgress *_Nullable)progressInfo;

@end


@interface NetworkCenter : NSObject

+ (nonnull instancetype)sharedInstance;

- (void)setValue:(NSString *_Nullable)value forHTTPHeaderField:(NSString *_Nonnull)field;

- (void)addDelegate:(_Nonnull id<NetworkCenterDelegate>)delegate;

- (void)removeDelegate:(_Nonnull id<NetworkCenterDelegate>)delegate;

- (void)sendRequest:(NSString *_Nonnull)requestURL
             method:(HTTPMethod)method
         parameters:(id _Nullable)parameters
         completion:(NetworkRequestCompletion _Nullable)completionBlock;

- (void)sendRequest:(NSString *_Nonnull)requestURL
             method:(HTTPMethod)method
         parameters:(id _Nullable)parameters
           progress:(void (^_Nullable)(NSProgress *_Nonnull))taskProgress
         completion:(NetworkRequestCompletion _Nullable)completionBlock;

@end
