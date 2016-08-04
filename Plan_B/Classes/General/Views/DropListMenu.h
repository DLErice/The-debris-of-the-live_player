//
//  DropListMenu.h
//  OneTargetCClient
//
//  Created by DLErice on 12/3/15.
//  Copyright © 2016 DLErice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropListMenu : UIView

@property (nonatomic, assign) BOOL expandStatus;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, copy) void (^onMenuItemTapped)(NSInteger index);

@end
