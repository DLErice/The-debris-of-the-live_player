//
//  ActivityTableView.h
//  Plan_B
//
//  Created by DLErice on 16/6/22.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityData : NSObject
@property (nonatomic, copy) NSString *activityImageUrl;
@property (nonatomic, copy) NSString *activityTitle;
@property (nonatomic, copy) NSString *activityStartTime;
//@property (nonatomic, copy) NSString *  // 倒计时
@property (nonatomic, copy) NSString *activityApplyNumber;

@end

@interface ActivityTableView : UITableView

@property (nonatomic, strong) NSArray<ActivityData *> *ativityList;

@end
