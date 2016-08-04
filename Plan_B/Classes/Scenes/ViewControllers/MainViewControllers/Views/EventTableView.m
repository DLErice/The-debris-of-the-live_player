//
//  EventTableView.m
//  Plan_B
//
//  Created by DLErice on 16/5/16.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "EventTableView.h"

@implementation EventData




@end


#pragma mark - EventTableViewCell

@interface EventTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLable;
@property (nonatomic, strong) UILabel *barNameLabel;
@property (nonatomic, strong) UILabel *addressLable;
@property (nonatomic, strong) UILabel *statusLable;
@end

@implementation EventTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        _imgView = [UIImageView new];
        _titleLabel = [UILabel new];
        _timeLable = [UILabel new];
        _barNameLabel = [UILabel new];
        _addressLable = [UILabel new];
        
        [NSObject apply:^(id obj) {
            UILabel *label = obj;
            label.textColor = [UIColor colorWithWhite:0.416 alpha:1.000];
        } forObjects:_timeLable, _addressLable, nil];
        
        [NSObject apply:^(id obj) {
            UILabel *label = obj;
            label.font =  [UIFont systemFontOfSize:13];
        } forObjects:_barNameLabel, _addressLable, _timeLable, nil];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        
        UIImageView *timeImgView = [UIImageView new];
        UIImageView *addressImgView = [UIImageView new];
        UIImageView *statusImgView = [UIImageView new];
        UIView *containerBgView = self.contentView;
        UIView * containerView = [UIView new];
        
        self.statusLable = [UILabel new];
        self.statusLable.text = @"已开始";
        self.statusLable.font = [UIFont boldSystemFontOfSize:16.0f];
        self.statusLable.backgroundColor = [UIColor colorWithRed:0.984 green:0.055 blue:0.216 alpha:1.000];
        self.statusLable.textColor = [UIColor whiteColor];
        self.statusLable.textAlignment = NSTextAlignmentCenter;
        self.statusLable.transform =  CGAffineTransformMakeRotation(M_PI*0.25);
        
        timeImgView.image = LOADIMAGE(@"time");
        addressImgView.image = LOADIMAGE(@"location");
        containerBgView.backgroundColor = RGB(234, 234, 234);
        containerView.backgroundColor = RGB(255, 255, 255);
        containerView.layer.masksToBounds = YES;
        [containerBgView addSubview:containerView];
        
        [containerView addSubviews:_imgView, _titleLabel, _timeLable, _barNameLabel, _addressLable, timeImgView, addressImgView, statusImgView, nil];
        
        [_imgView addSubview:self.statusLable];
        
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(containerView.width);
            make.height.equalTo(_imgView.width).multipliedBy(0.6);
            make.left.equalTo(containerView.left);
            make.top.equalTo(containerView.top);
        }];
        
        [self.statusLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@110);
            make.height.equalTo(@30);
            make.right.equalTo(_imgView.right).offset(28);
            make.centerY.equalTo(_imgView.top).offset(28);
        }];

        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@20);
            make.width.equalTo(@140);
            make.top.equalTo(_imgView.bottom).offset(5);
            make.left.equalTo(containerView.left).offset(15);
        }];
        
        [_barNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@20);
            make.width.equalTo(@100);
            make.left.equalTo(_titleLabel.left).offset(0);
            make.top.equalTo(_titleLabel.bottom).offset(0);
            make.bottom.equalTo(containerView.bottom).offset(-10);
        }];
 
        [_timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@20);
            make.width.equalTo(@140);
            make.top.equalTo(_imgView.bottom).offset(0);
            make.right.equalTo(containerView.right).offset(15);
        }];

        [_addressLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_timeLable.right);
            make.top.equalTo(_timeLable.bottom).offset(0);
            make.width.equalTo(@140);
            make.height.equalTo(@20);
        }];
        
        [addressImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@10);
            make.height.equalTo(@13);
            make.right.equalTo(_addressLable.left).offset(-5);
            make.centerY.equalTo(_addressLable.centerY);
        }];
        
        [timeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@13);
            make.width.equalTo(@13);
            make.right.equalTo(_timeLable.left).offset( -5);
            make.centerY.equalTo(_timeLable.centerY);
        }];
        
        [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(containerBgView.top).offset(9);
            make.left.equalTo(containerBgView.left).offset(5);
            make.right.equalTo(containerBgView.right).offset(-5);
            make.bottom.equalTo(containerBgView.bottom);
        }];
    }
    return self;
}

@end


#pragma mark - EventTableView

@interface EventTableView ()

@end

@implementation EventTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.estimatedRowHeight = 350;
        self.rowHeight = UITableViewAutomaticDimension;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
//    return self.eventDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellID = @"EventTableCell";
    EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellID];
    
    if (!cell) {
        cell = [[EventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCellID];

    }
    NSString *imgName = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.imgView.image = LOADIMAGE(imgName);
    cell.titleLabel.text = @"不民谣不音乐";
    cell.barNameLabel.text = @"后海一号酒吧";
    cell.addressLable.text = @"中山东一路18号";
    cell.timeLable.text = @"5.20 19:00";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    EventData * data = _eventDataArray[indexPath.row];
    if (self.selectionBlock) {
        self.selectionBlock(data);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 3;
}

@end
