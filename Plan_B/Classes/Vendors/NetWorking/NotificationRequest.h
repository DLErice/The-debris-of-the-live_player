//
//  NotificationRequest.h
//  OneTargetGClient
//
//  Created by DLErice on 3/3/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "BaseRequest.h"
#import "JMNotification.h"

typedef void (^NotificationRequestBlock)(NSArray<JMNotification *> *, NSString *lastTimeline, NSError *error);


@interface NotificationRequest : BaseRequest

- (void)obtainTaskNotifications:(NSString *)timeline count:(NSUInteger)count completion:(NotificationRequestBlock)completion;

- (void)obtainSystemNotifications:(NSString *)timeline count:(NSUInteger)count completion:(NotificationRequestBlock)completion;

@end
