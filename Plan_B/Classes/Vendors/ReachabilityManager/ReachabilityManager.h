//
//  ReachabilityManager.h
//  OneTargetGClient
//
//  Created by DLErice on 3/29/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NetworkReachabilityStatus) {
    NetworkReachabilityStatusUnknown,
    NetworkReachabilityStatusNotReachable,
    NetworkReachabilityStatusReachable
};

@class ReachabilityManager;

@protocol ReachabilityManagerDelegate <NSObject>

- (void)reachabilityManager:(ReachabilityManager *)manager status:(NetworkReachabilityStatus)status;

@end


@interface ReachabilityManager : NSObject

+ (instancetype)sharedManager;

- (void)addDelegate:(id<ReachabilityManagerDelegate>)delegate;

- (void)removeDelegate:(id<ReachabilityManagerDelegate>)delegate;

@end
