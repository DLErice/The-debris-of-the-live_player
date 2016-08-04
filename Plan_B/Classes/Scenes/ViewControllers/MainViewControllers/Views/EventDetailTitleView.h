//
//  EventDetailTitleView.h
//  Plan_B
//
//  Created by DLErice on 16/5/25.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventSpeciallyInviteSingerModel : NSObject
@property (nonatomic, strong) UIImage *singerImage;
@property (nonatomic, strong) NSString *singerImageURL;
@property (nonatomic, strong) NSString *singerName;
@property (nonatomic, assign) BOOL isBigV;
@end

@interface EventSpeciallyInviteSingerScrollView : UIScrollView <UIScrollViewDelegate>
@property (nonatomic, copy) void(^SetSpeciallyInviteSingerBlock)(NSArray<EventSpeciallyInviteSingerModel*> *modelArray);
@end

@interface EventParticipatePeopleScrollView : UIScrollView
@property (nonatomic, copy) void(^SetPeopleImageBlock)(NSArray<UIImage *> *audienceArray);
@end

@interface EventDetailTitleView : UIView
@property (nonatomic, copy) void(^SetTitleBlock)(NSString * title);
@end
