//
//  UserPanelView.m
//  OneTargetGClient
//
//  Created by DLErice on 1/4/16.
//  Copyright © 2016 onetarget. All rights reserved.
//

#import "UserPanelView.h"

#pragma mark - UserPanelCell

@interface UserPanelCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation UserPanelCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];

        UIView *containerView = self.contentView;

        _iconImageView = [UIImageView new];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [containerView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.width.height.equalTo(@48);
            make.centerX.equalTo(containerView.centerX);
            make.top.equalTo(@36);
        }];

        _name = [UILabel new];
        _name.textColor = RGB(80, 80, 80);
        _name.textAlignment = NSTextAlignmentCenter;
        [containerView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(containerView.width);
            make.centerX.equalTo(containerView.centerX);
            make.top.equalTo(_iconImageView.bottom).offset(18);
            make.height.equalTo(@(OTLabelHeightPerLine));
        }];
    }

    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];

    _name.textColor = highlighted ? RGB(200, 100, 200) : RGB(80, 80, 80);
}

@end

#pragma mark - UserPanelView

@implementation UserPanelView

@dynamic dataItems;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithCellType:[UserPanelCell class]]) {
        @weakify(self);

        self.configCellBlock = ^(UICollectionViewCell *cell, NSIndexPath *indexPath) {
            @strongify(self);

            UserPanelCell *panel = (__kindof UICollectionViewCell *)cell;
            UserPanelDataType data = self.dataItems[indexPath.row];

            panel.name.text = [[data allKeys] firstObject];
            panel.iconImageView.image = LOADIMAGE([[data allValues] firstObject]);
        };
    }

    return self;
}

@end
