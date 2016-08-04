//
//  OTRefresh.m
//  OneTargetCommon
//
//  Created by DLErice on 3/9/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "OTRefresh.h"

@implementation OTRefresh

+ (MJRefreshHeader *)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];

    header.lastUpdatedTimeLabel.hidden = YES;

    return header;
}

+ (MJRefreshHeader *)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];

    header.lastUpdatedTimeLabel.hidden = YES;

    return header;
}

+ (MJRefreshFooter *)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    MJRefreshAutoNormalFooter *footer = [[MJRefreshAutoNormalFooter alloc] init];

    [footer setRefreshingTarget:target refreshingAction:action];
    return footer;
}

+ (MJRefreshFooter *)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock
{
    MJRefreshAutoNormalFooter *footer = [[MJRefreshAutoNormalFooter alloc] init];

    footer.refreshingBlock = refreshingBlock;
    return footer;
}

@end


@implementation UIScrollView (RefreshHeader)

- (void)setRefreshHeader:(MJRefreshHeader *)refreshHeader
{
    self.mj_header = refreshHeader;
}

- (MJRefreshHeader *)refreshHeader
{
    return self.mj_header;
}

- (void)setRefreshFooter:(MJRefreshFooter *)refreshFooter
{
    self.mj_footer = refreshFooter;
}

- (MJRefreshFooter *)refreshFooter
{
    return self.mj_footer;
}

@end
