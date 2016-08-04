//
//  DropListMenu.m
//  OneTargetCClient
//
//  Created by DLErice on 12/3/15.
//  Copyright © 2016 DLErice. All rights reserved.
//

#import "DropListMenu.h"

#define kTableRowHeight 50

@interface DropListMenu () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DropListMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;

        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = kTableRowHeight;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];

        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.width);
            make.height.equalTo(self.height);
            make.bottom.equalTo(self.top);
        }];

        UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [_tableView addSubview:blurView];
        [blurView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];

        [_tableView sendSubviewToBack:blurView];

#if DEBUG
        NSMutableArray *arr = [NSMutableArray new];

        for (int i = 0; i < 10; i++) {
            [arr addObject:[NSString stringWithFormat:@"Item %d", i]];
        }

        _dataSource = arr;
#endif
    }

    return self;
}

#pragma mark - Public

#pragma mark - Property

- (void)setExpandStatus:(BOOL)expandStatus
{
    _expandStatus = expandStatus;

    self.userInteractionEnabled = _expandStatus;

    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.width);
        make.height.equalTo(self.height);
        make.bottom.equalTo(_expandStatus ? self.bottom : self.top);
    }];

    NSTimeInterval interval = _expandStatus ? .2f : .15f;

    [UIView animateWithDuration:interval
                     animations:^{
        [_tableView layoutIfNeeded];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellID = @"DropListMenuCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellID];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }

    cell.textLabel.text = _dataSource[indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.expandStatus = !self.expandStatus;

    if (self.onMenuItemTapped) {
        self.onMenuItemTapped(indexPath.row);
    }
}

@end
