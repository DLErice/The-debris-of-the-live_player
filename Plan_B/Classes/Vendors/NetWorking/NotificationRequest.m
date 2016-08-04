//
//  NotificationRequest.m
//  OneTargetGClient
//
//  Created by DLErice on 3/3/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "NotificationRequest.h"

#define kSTRKey_Timeline    @"timeline"
#define kSTRKey_Count       @"count"

#define kSTRKey_MessageList @"messageList"


@implementation NotificationRequest

- (void)obtainTaskNotifications:(NSString *)timeline count:(NSUInteger)count completion:(NotificationRequestBlock)completion
{
    NSString *strURL = kFuckingRequestRelativeURLPrefix "message/taskNotifications";
    NSDictionary *params = @{
        kSTRKey_Timeline: timeline ? : @"",
        kSTRKey_Count: @(count)
    };

    [NETWORKCENTER sendRequest:strURL
                        method:HTTPMethodGet
                    parameters:params
                    completion:^(BaseResponse *obj, NSError *error) {
        NSArray<JMNotification *> *arrList = nil;
        NSString *strTimeline = nil;

        if (obj) {
            NSArray *arrDict = obj.data[kSTRKey_MessageList];
            strTimeline = obj.data[kSTRKey_Timeline];

            arrList = [JMNotification arrayOfModelsFromDictionaries:arrDict];

            if (arrDict && !arrList) {
                error = OTError_JSONModelConversion;
            }
        }

        if (completion) {
            completion(arrList, strTimeline, error);
        }
    }];
}

- (void)obtainSystemNotifications:(NSString *)timeline count:(NSUInteger)count completion:(NotificationRequestBlock)completion
{
    NSString *strURL = kFuckingRequestRelativeURLPrefix "message/systemNotifications";
    NSDictionary *params = @{
        kSTRKey_Timeline: timeline ? : @"",
        kSTRKey_Count: @(count)
    };

    [NETWORKCENTER sendRequest:strURL
                        method:HTTPMethodGet
                    parameters:params
                    completion:^(BaseResponse *obj, NSError *error) {
        NSArray<JMNotification *> *arrList = nil;
        NSString *strTimeline = nil;

        if (obj) {
            NSArray *arrDict = obj.data[kSTRKey_MessageList];
            strTimeline = obj.data[kSTRKey_Timeline];

            arrList = [JMNotification arrayOfModelsFromDictionaries:arrDict];

            if (arrDict && !arrList) {
                error = OTError_JSONModelConversion;
            }
        }

        if (completion) {
            completion(arrList, strTimeline, error);
        }
    }];
}

@end
