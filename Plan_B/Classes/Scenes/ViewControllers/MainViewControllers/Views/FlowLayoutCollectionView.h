//
//  FlowLayoutCollectionView.h
//  OneTargetGClient
//
//  Created by DLErice on 1/4/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlowLayoutCollectionSectionHeaderView : UICollectionReusableView

@property (nonatomic, copy) UIView * (^configCell)(void);

@end

@interface FlowLayoutCollectionView : UICollectionView

@property (nonatomic, strong, readonly) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, assign) CGSize cellSize;

@property (nonatomic, strong) NSArray *dataItems;

@property (nonatomic, copy) void (^ configCellBlock)(UICollectionViewCell *cell, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^ selectCellBlock)(NSIndexPath *indexPath);

// section header
@property (nonatomic, assign) CGSize sectionHeaderSize;
@property (nonatomic, copy) UIView * (^configHeaderView)(FlowLayoutCollectionSectionHeaderView *, NSIndexPath *);

- (instancetype)initWithCellType:(Class)cellClass;

@end
