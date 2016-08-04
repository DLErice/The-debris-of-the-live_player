//
//  BaseRequest.m
//  OneTargetGClient
//
//  Created by DLErice on 2/25/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "BaseRequest.h"

#define HUDDebugLog 0


@interface BaseRequest () <NetworkCenterDelegate>

@property (nonatomic, strong) MBProgressHUD *hudIndicator;

@end

@implementation BaseRequest

+ (instancetype)request
{
    BaseRequest *request = [[self alloc] init];

    // We will release this strong delegate reference after the request is finished.
    [NETWORKCENTER addDelegate:request];

    return request;
}

#pragma mark - NetworkCenterDelegate

- (void)networkRequestProgress:(NetworkRequestProgress)progressOption progress:(NSProgress *)progressInfo
{
    switch (progressOption) {
        case NetworkRequestProgressStart:

            if (_showHUDIndicator) {
                _hudIndicator = [HUDHelper showHUDIndicatorInWindow];
#if HUDDebugLog
                DDLogDebug(@"show indicator for %@ request.", NSStringFromClass([self class]));
#endif
            }

            break;

        case NetworkRequestProgressOngoing:
            break;

        case NetworkRequestProgressFinished:

            if (_showHUDIndicator) {
                [_hudIndicator hide:YES];
#if HUDDebugLog
                DDLogDebug(@"hide indicator for %@ request.", NSStringFromClass([self class]));
#endif
            }

            [NETWORKCENTER removeDelegate:self];

            break;
    }
}

@end
