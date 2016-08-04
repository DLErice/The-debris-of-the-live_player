//
//  LiveTableView.h
//  Plan_B
//
//  Created by DLErice on 16/5/20.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma marl - LiveData
@interface LiveData : NSObject

@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * imgUrl;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * barNam;
@property (nonatomic, strong) NSString * address;

@end


@interface LiveTableView : UITableView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray<LiveData *> * liveDataArray;
@property (nonatomic, copy) OTActionWithIndexBlock selectionBlock;


@end
