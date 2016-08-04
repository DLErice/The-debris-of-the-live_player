//
//  FlowLayoutCollectionView.m
//  OneTargetGClient
//
//  Created by DLErice on 1/4/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "FlowLayoutCollectionView.h"

#define kSTRKey_FlowLayoutCollectionCellID          @"FlowLayoutCollectionCellID"
#define kSTRKey_FlowLayoutCollectionSectionHeaderID @"FlowLayoutCollectionSectionHeaderID"


#pragma mark - FlowLayoutCollectionSectionHeaderView

@implementation FlowLayoutCollectionSectionHeaderView
{
    BOOL loadCustomViewOnce; // DLErice's hack
}

- (void)layoutSubviews
{
    if (self.configCell && !loadCustomViewOnce) {
        loadCustomViewOnce = YES;

        UIView *customView = self.configCell();
        UIView *containerView = self;

        [containerView addSubview:customView];
        [customView mas_makeConstraints:^(MASConstraintMaker *make){
            make.edges.equalTo(containerView);
        }];
        
    }

    [super layoutSubviews];
}

@end

#pragma mark - FlowLayoutCollectionView

@interface FlowLayoutCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) Class cellClass;

@end


@implementation FlowLayoutCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    return [self initWithCellType:[UICollectionViewCell class]];
}

- (instancetype)initWithCellType:(Class)cellClass
{
    NSParameterAssert(cellClass);

    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];

    if (self = [super initWithFrame:CGRectZero collectionViewLayout:flowLayout]) {
        _flowLayout = flowLayout;
        _cellClass = cellClass;

        self.dataSource = self;
        self.delegate = self;

        self.backgroundColor = [UIColor clearColor];
        [self registerClass:_cellClass forCellWithReuseIdentifier:kSTRKey_FlowLayoutCollectionCellID];
    }

    return self;
}

#pragma mark -

- (void)setDataItems:(NSArray *)dataItems
{
    if (![_dataItems isEqual:dataItems]) {
        _dataItems = dataItems;

        [self reloadData];
    }
}

- (void)setCellSize:(CGSize)cellSize
{
    _cellSize = cellSize;
    _flowLayout.itemSize = _cellSize;
}

- (void)setSectionHeaderSize:(CGSize)sectionHeaderSize
{
    NSAssert(!CGSizeEqualToSize(CGSizeZero, sectionHeaderSize), @"Invalid section header size!");
    _sectionHeaderSize = sectionHeaderSize;

    _flowLayout.headerReferenceSize = sectionHeaderSize;
    [self registerClass:[FlowLayoutCollectionSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSTRKey_FlowLayoutCollectionSectionHeaderID];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSTRKey_FlowLayoutCollectionCellID forIndexPath:indexPath];

    if (self.configCellBlock) {
        self.configCellBlock(cell, indexPath);
    }

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        FlowLayoutCollectionSectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSTRKey_FlowLayoutCollectionSectionHeaderID forIndexPath:indexPath];

        @weakify(headerView);

        headerView.configCell = ^ {
            @strongify(headerView);

            UIView *resultView = nil;

            if (self.configHeaderView) {
                resultView = self.configHeaderView(headerView, indexPath);
            }

            return resultView;
        };

        reusableview = headerView;
    }

    return reusableview;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectCellBlock) {
        self.selectCellBlock(indexPath);
    }
}

@end
