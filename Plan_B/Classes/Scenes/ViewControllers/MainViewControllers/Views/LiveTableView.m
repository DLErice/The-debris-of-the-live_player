//
//  LiveTableView.m
//  Plan_B
//
//  Created by DLErice on 16/5/20.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "LiveTableView.h"
#import "SKTagView.h"
#import "HexColors.h"

#pragma mark - LiveData
@implementation LiveData

@end

#pragma mark - LiveTableViewCell

@interface LiveTableVIewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *liveImageView;
@property (nonatomic, strong) UILabel *liveActionNameLabel;
@property (nonatomic, strong) UILabel *barNameLabel;
@property (nonatomic, strong) UILabel * attentionPeopleCountLable;
@end

@implementation  LiveTableVIewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _liveImageView = [UIImageView new];
        _liveActionNameLabel = [UILabel new];
        _barNameLabel = [UILabel new];
        _attentionPeopleCountLable = [UILabel new];
        
        UIImageView *barImgView = [UIImageView new];
        UIImageView *attentionImageView = [UIImageView new];
        
        UIView *containerBgView = self.contentView;
        UIView * containerView = [UIView new];
        
        barImgView.image = LOADIMAGE(@"jiubaming_icon");
        attentionImageView.image = LOADIMAGE(@"guankanrenshu_icon");
        _attentionPeopleCountLable.textColor = RGB(116, 116, 116);
        _attentionPeopleCountLable.font = [UIFont systemFontOfSize:14.0f];
        containerView.backgroundColor = [UIColor whiteColor];
        containerBgView.backgroundColor = RGB(234, 234, 234);
        _liveActionNameLabel.font = [UIFont boldSystemFontOfSize:17.0f];
        _liveActionNameLabel.textColor = RGB(2, 2, 2);
        _barNameLabel.font = [UIFont systemFontOfSize:15.0f];
        
        [containerBgView addSubview:containerView];
        [containerView addSubviews:_liveImageView, _liveActionNameLabel, _barNameLabel, _attentionPeopleCountLable, barImgView, attentionImageView, nil];
       
        [_liveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(containerView.width);
            make.height.equalTo(_liveImageView.width).multipliedBy(0.6);
            make.left.equalTo(containerView.left);
            make.top.equalTo(containerView.top);
        }];
        
        [_liveActionNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_liveImageView.bottom);
            make.left.equalTo(containerView.left).offset(15);
            make.right.equalTo(containerView.right);
            make.height.equalTo(@30);
        }];
        
        [barImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_liveActionNameLabel.bottom);
            make.left.equalTo(_liveActionNameLabel.left);
            make.width.equalTo(@20);
            make.height.equalTo(barImgView.width);
            make.bottom.equalTo(containerView.bottom).offset(-10);
        }];
        
        [_attentionPeopleCountLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(barImgView.centerY);
            make.right.equalTo(containerView.right);
            make.width.equalTo(@70);
            make.height.equalTo(@30);
        }];
        
        [attentionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_attentionPeopleCountLable.centerY);
            make.right.equalTo(_attentionPeopleCountLable.left).offset(-3);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
        }];
        
        [_barNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(barImgView.centerY);
            make.left.equalTo(barImgView.right).offset(3);
            make.right.equalTo(attentionImageView.left);
            make.height.equalTo(@30);
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


#pragma mark - LiveTableView

@interface LiveTableView ()

@end

@implementation LiveTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        self.sectionFooterHeight = 0;
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.estimatedRowHeight = 1000;
        self.rowHeight = UITableViewAutomaticDimension;
    }
    return  self;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    //    return self.eventDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellID = @"LiveTableCell";
    LiveTableVIewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellID];
    
    if (!cell) {
        cell = [[LiveTableVIewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCellID];
        
    }
    NSString *imgName = [NSString stringWithFormat:@"l_%ld",indexPath.row];
    cell.liveImageView.image = LOADIMAGE(imgName);
    cell.liveActionNameLabel.text = @"基地ROCK专场，JUST ROCK IT";
    cell.barNameLabel.text = @"后海1号";
    
    cell.attentionPeopleCountLable.text = @"2566";


    return cell;
}



//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    //    [_arrIndex sortUsingSelector:@selector(compare:)];
//    return _arrIndex;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    //    [self.arrIndex sortUsingSelector:@selector(compare:)];
//    return [self.arrIndex indexOfObject:title];
//}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.selectionBlock) {
        //        self.selectionBlock(indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
        return CGFLOAT_MIN;
//    return 114;
}




@end
