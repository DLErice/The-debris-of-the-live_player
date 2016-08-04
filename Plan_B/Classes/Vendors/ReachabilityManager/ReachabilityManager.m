//
//  ReachabilityManager.m
//  OneTargetGClient
//
//  Created by DLErice on 3/29/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "ReachabilityManager.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import "NetworkCenter.h"
#import <EXTScope.h>

@interface ReachabilityManager ()

@property (nonatomic, strong) AFNetworkReachabilityManager *reachabilityManager;
@property (nonatomic, strong) NSMutableArray<id<ReachabilityManagerDelegate> > *delegates;

@end

@implementation ReachabilityManager

- (instancetype)init
{
    if (self = [super init]) {
        _delegates = [NSMutableArray new];

        _reachabilityManager = [AFNetworkReachabilityManager sharedManager];
        [_reachabilityManager startMonitoring];

        @weakify(self);

        [_reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus stauts) {
            NetworkReachabilityStatus result = NetworkReachabilityStatusUnknown;

            switch (stauts) {
                case AFNetworkReachabilityStatusUnknown:
                    result = NetworkReachabilityStatusUnknown;
                    break;

                case AFNetworkReachabilityStatusNotReachable:
                    result = NetworkReachabilityStatusNotReachable;
                    break;

                case AFNetworkReachabilityStatusReachableViaWiFi:
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    result = NetworkReachabilityStatusReachable;
                    break;
            }

            @strongify(self);

            NSArray *arrCopy = [self.delegates copy];

            for (id<ReachabilityManagerDelegate> item in arrCopy) {
                [item reachabilityManager:self
                                   status:result];
            }
        }];
    }

    return self;
}

- (void)dealloc
{
    [_delegates removeAllObjects];
    [_reachabilityManager stopMonitoring];
}

#pragma mark - Public

+ (instancetype)sharedManager
{
    static ReachabilityManager *gManager;

    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        gManager = [ReachabilityManager new];
    });

    return gManager;
}

- (void)addDelegate:(id<ReachabilityManagerDelegate>)delegate
{
    [_delegates addObject:delegate];
}

- (void)removeDelegate:(id<ReachabilityManagerDelegate>)delegate
{
    [_delegates removeObject:delegate];
}

@end
