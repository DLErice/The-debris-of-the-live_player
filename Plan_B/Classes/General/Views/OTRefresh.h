//
//  OTRefresh.h
//  OneTargetCommon
//
//  Created by DLErice on 3/9/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@interface OTRefresh : UIView

+ (MJRefreshHeader *)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

+ (MJRefreshHeader *)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;

+ (MJRefreshFooter *)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

+ (MJRefreshFooter *)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;

@end

@interface UIScrollView (RefreshHeader)

// map property to mj_header/mj_footer
@property (strong, nonatomic) MJRefreshHeader *refreshHeader;
@property (strong, nonatomic) MJRefreshFooter *refreshFooter;

@end