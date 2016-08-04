//
//  ActivityTableView.m
//  Plan_B
//
//  Created by DLErice on 16/6/22.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "ActivityTableView.h"

#pragma mark - ActivityData
@implementation ActivityData


@end

#pragma mark - ActivityTableCell

@interface ActivityTableCell : UITableViewCell
@property (nonatomic, strong) UIImageView *activityImgView;
@property (nonatomic, strong) UILabel *activityTitleLable;
@property (nonatomic, strong) UILabel *activityStartTimeLable;
@property (nonatomic, strong) UILabel *activityCountdownLable;
@property (nonatomic, strong) UILabel *activityApplyNumberLable;
@end

@implementation ActivityTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
     if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         self.selectionStyle = UITableViewCellSelectionStyleNone;
         _activityImgView = [UIImageView new];
         _activityTitleLable = [UILabel new];
         _activityStartTimeLable = [UILabel new];
         _activityCountdownLable = [UILabel new];
         _activityApplyNumberLable = [UILabel new];
         UIImageView *applyImageView = [UIImageView new];
         
         _activityImgView.image = LOADIMAGE(@"banner2");
         _activityTitleLable.text = @"MC带你HIGH上天";
         _activityStartTimeLable.text = @"2016年4月5日 20:30";
         _activityCountdownLable.text = @"  距离活动开始还有5:00:00  ";
         _activityApplyNumberLable.text = @"已报名：333人";
         
         
        
         UIView *containerBgView = self.contentView;
         UIView *containerView = [UIView new];
         self.contentView.backgroundColor = [UIColor colorWithRed:0.925 green:0.929 blue:0.925 alpha:1.000];
         [self.contentView addSubview:containerView];
         containerView.backgroundColor = [UIColor whiteColor];
         containerView.layer.cornerRadius = 5.0f;
         containerView.layer.masksToBounds = YES;
         containerView.layer.borderWidth = 1.0f;
         containerView.layer.borderColor = [UIColor colorWithWhite:0.816 alpha:0.620].CGColor;
         [containerView addSubviews:_activityImgView, _activityTitleLable, _activityStartTimeLable, _activityCountdownLable,  _activityApplyNumberLable, applyImageView,nil];
         
         [containerBgView addSubview:containerView];
         
         _activityTitleLable.font = [UIFont boldSystemFontOfSize:15.0f];
         _activityStartTimeLable.font = [UIFont systemFontOfSize:13.0f];
         _activityStartTimeLable.textColor = [UIColor colorWithWhite:0.325 alpha:1.000];
         _activityCountdownLable.textColor = [UIColor colorWithRed:0.992 green:0.984 blue:0.988 alpha:1.000];
         _activityCountdownLable.backgroundColor = [UIColor colorWithRed:0.980 green:0.714 blue:0.165 alpha:1.000];
         _activityCountdownLable.font = [UIFont systemFontOfSize:13.0f];
#warning 不太确定的值
         _activityCountdownLable.layer.cornerRadius = 15;
         _activityCountdownLable.layer.masksToBounds = YES;
         _activityCountdownLable.numberOfLines = 1;
         [_activityCountdownLable setContentHuggingPriority:(UILayoutPriorityRequired) forAxis:(UILayoutConstraintAxisHorizontal)];
         [_activityCountdownLable setContentCompressionResistancePriority:UILayoutPriorityRequired
     forAxis:UILayoutConstraintAxisHorizontal];
         [_activityCountdownLable setTranslatesAutoresizingMaskIntoConstraints:NO];
         
         _activityApplyNumberLable.font = [UIFont systemFontOfSize:13];
         _activityApplyNumberLable.textColor = [UIColor colorWithWhite:0.600 alpha:1.000];
         
         applyImageView.image = LOADIMAGE(@"attentionApply");
         
         [_activityImgView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(containerView.top);
             make.left.equalTo(containerView.left);
             make.right.equalTo(containerView.right);
             make.height.equalTo(_activityImgView.width).multipliedBy(0.537);
         }];
         
         [_activityTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(_activityImgView.bottom).offset(0);
             make.left.equalTo(containerView.left).offset(10);
             make.right.equalTo(containerView.right);
             make.height.equalTo(@30);
         }];
         
         [_activityStartTimeLable mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(_activityTitleLable.bottom).offset(-8);
             make.left.equalTo(_activityTitleLable.left);
             make.right.equalTo(containerView.right);
             make.height.equalTo(@30);
         }];
         
         [_activityApplyNumberLable mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.equalTo(containerView.right).offset(-10);
             make.top.equalTo(_activityStartTimeLable.bottom).offset(-3);
             make.width.equalTo(@90);
         }];
         
         [applyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.height.equalTo(@15);
             make.width.equalTo(@15);
             make.right.equalTo(_activityApplyNumberLable.left).offset(-3);
             make.centerY.equalTo(_activityApplyNumberLable.centerY);
             make.bottom.equalTo(containerView.bottom).offset(-25);
         }];
         
         [_activityCountdownLable mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(_activityStartTimeLable.bottom);
             make.left.equalTo(_activityStartTimeLable.left);
             make.height.equalTo(@30);
             make.right.lessThanOrEqualTo(_activityApplyNumberLable.left);
         }];
         
         [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(containerBgView.top).offset(8);
             make.left.equalTo(containerBgView.left).offset(6);
             make.right.equalTo(containerBgView.right).offset(-6);
             make.bottom.equalTo(containerBgView.bottom);
         }];
     }
    return self;
}



@end

#pragma mark - ActivityTableView

@interface ActivityTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ActivityTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
//        self.estimatedRowHeight = 40;
//        self.rowHeight = UITableViewAutomaticDimension;
        self.backgroundColor = [UIColor clearColor];
//        self.rowHeight = 450;
        
        self.estimatedRowHeight = 350;
        self.rowHeight = UITableViewAutomaticDimension;
    }
    return self;
}


#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

        static NSString *strCellID = @"ActivityTableCell";
        ActivityTableCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellID];
        
        if (!cell) {
            cell = [[ActivityTableCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strCellID];
        }
        
    
        return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 3;
}



@end
