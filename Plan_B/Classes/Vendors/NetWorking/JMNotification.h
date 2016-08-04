//
//  JMNotification.h
//  OneTargetGClient
//
//  Created by DLErice on 3/3/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "JMBaseModel.h"

@interface JMNotification : JMBaseModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *time;

@end
