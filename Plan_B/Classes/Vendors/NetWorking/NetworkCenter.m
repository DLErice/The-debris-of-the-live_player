//
//  NetworkCenter.m
//  OneTargetGClient
//
//  Created by DLErice on 2/24/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "NetworkCenter.h"
#import <AFNetworking/AFNetworking.h>

#if DEBUG
#define kSTRBaseURL @"http://139.196.176.237:8080/"
#else
#define kSTRBaseURL @"http://139.196.176.237:8080/"
#endif


#pragma mark - Secure Random String

NSString * GenerateSecureString(NSUInteger length)
{
    NSMutableData *data = [NSMutableData dataWithLength:length];

    int result = SecRandomCopyBytes(NULL, length, data.mutableBytes);

    if (result != 0) {
        DDLogError(@"Error generating random bytes: %d", errno);
    }

    NSString *base64EncodedData = [data base64EncodedStringWithOptions:0];

    return base64EncodedData;
}

NSString * GetSecurityCode()
{
    static NSString *strCode = nil;

    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        strCode = GenerateSecureString(16);
    });

    NSLog(@"security code: %@", strCode);
    return strCode;
}

#pragma mark - NetworkCenter

@interface NetworkCenter ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) NSMutableArray<id<NetworkCenterDelegate> > *delegates;

@end

@implementation NetworkCenter

- (instancetype)init
{
    if (self = [super init]) {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];

        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kSTRBaseURL] sessionConfiguration:sessionConfiguration];

        _sessionManager.responseSerializer.stringEncoding = NSUTF8StringEncoding;

        _delegates = [NSMutableArray new];
    }

    return self;
}

+ (instancetype)sharedInstance
{
    static NetworkCenter *gNetworkCenter = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        gNetworkCenter = [NetworkCenter new];
    });

    return gNetworkCenter;
}

- (void)setValue:(NSString *_Nullable)value forHTTPHeaderField:(NSString *_Nonnull)field
{
    [_sessionManager.requestSerializer
                  setValue:value
        forHTTPHeaderField:field];
}

- (void)addDelegate:(_Nonnull id<NetworkCenterDelegate>)delegate
{
    [_delegates addObject:delegate];
}

- (void)removeDelegate:(_Nonnull id<NetworkCenterDelegate>)delegate
{
    [_delegates removeObject:delegate];
}

#pragma mark - Send Request

- (void)sendRequest:(NSString *)requestURL
             method:(HTTPMethod)method
         parameters:(id)parameters
         completion:(NetworkRequestCompletion)completionBlock
{
    [self sendRequest:requestURL method:method parameters:parameters progress:nil completion:completionBlock];
}

- (void)sendRequest:(NSString *)requestURL
             method:(HTTPMethod)method
         parameters:(id)parameters
           progress:(void (^)(NSProgress *_Nonnull))taskProgress
         completion:(NetworkRequestCompletion)completionBlock
{
    id successBlock = ^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        BaseResponse *response = [[BaseResponse alloc] initWithDictionary:responseObject];

#if DEBUG

        if (response.code != 200) {
            DDLogError(@"Request task is handled with error: %@, code: %ld. URL: %@", response.message, (long)response.code, task.originalRequest.URL);
        }

#endif

        if (completionBlock) {
            completionBlock(response, nil);
        }

        [self requestCallback:NetworkRequestProgressFinished progress:nil];
    };

    id failureBlock = ^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
#if DEBUG
        DDLogError(@"Failed in task: %@, error: %@", task, error);
#endif

        if (completionBlock) {
            completionBlock(nil, error);
        }

        [self requestCallback:NetworkRequestProgressFinished progress:nil];
    };

    id progressBlock = ^(NSProgress *progress) {
        [self requestCallback:NetworkRequestProgressOngoing progress:progress];

        if (taskProgress) {
            taskProgress(progress);
        }
    };

    [self requestCallback:NetworkRequestProgressStart progress:nil];

    switch (method) {
        case HTTPMethodGet:
            [_sessionManager GET:requestURL
                      parameters:parameters
                        progress:progressBlock
                         success:successBlock
                         failure:failureBlock];
            break;

        case HTTPMethodPost:
            [_sessionManager POST:requestURL
                       parameters:parameters
                         progress:progressBlock
                          success:successBlock
                          failure:failureBlock];
            break;

        case HTTPMethodPut:

            if (taskProgress) {
                DDLogWarn(@"taskProgress is invalid for PUT request!");
            }

            [_sessionManager PUT:requestURL
                      parameters:parameters
                         success:successBlock
                         failure:failureBlock];
            break;

        case HTTPMethodDelete:

            if (taskProgress) {
                DDLogWarn(@"taskProgress is invalid for DELETE request!");
            }

            [_sessionManager DELETE:requestURL
                         parameters:parameters
                            success:successBlock
                            failure:failureBlock];
            break;
    }
}

#pragma mark - Private

- (void)requestCallback:(NetworkRequestProgress)progressOption progress:(NSProgress *)progressInfo
{
    // for safe copy
    NSArray *delegatesCopy = [_delegates copy];
    NSUInteger length = delegatesCopy.count;

    for (NSUInteger i = 0; i < length; i++) {
        [delegatesCopy[i] networkRequestProgress:progressOption progress:progressInfo];
    }
}

@end
