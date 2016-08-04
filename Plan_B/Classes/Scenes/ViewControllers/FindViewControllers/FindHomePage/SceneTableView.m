//
//  SceneTableView.m
//  Plan_B
//
//  Created by DLErice on 16/6/20.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "SceneTableView.h"

#pragma mark - SceneData

@implementation SceneData


@end

#pragma mark - SceneTableViewCell

@interface SceneTableViewCell : UITableViewCell

@property (nonatomic, strong) OTLabel *sceneBarNameLable;
@property (nonatomic, strong) OTLabel *sceneBarAddressLable;
@property (nonatomic, strong) OTLabel *sceneBarPhoneNumberLabel;
@property (nonatomic, strong) UIImageView *sceneBackgroundImageView;

@end

@implementation SceneTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *containerBGView = [UIView new];
        
        self.contentView.backgroundColor =  [UIColor colorWithRed:0.918 green:0.925 blue:0.933 alpha:1.000];
        [self.contentView addSubview:containerBGView];
        
        [containerBGView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top);
            make.left.equalTo(self.contentView.left);
            make.right.equalTo(self.contentView.right);
            make.bottom.equalTo(self.contentView.bottom);
        }];
        
        
        UIView *containerView = [UIView new];
        
        [containerBGView addSubview:containerView];
        containerView.layer.cornerRadius = 5.0f;
        containerView.layer.borderWidth = 1.0f;
        containerView.layer.borderColor = [UIColor colorWithRed:0.867 green:0.875 blue:0.882 alpha:1.000].CGColor;
        containerView.layer.masksToBounds = YES;
        containerView.backgroundColor = [UIColor whiteColor];
        
        [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(8);
            make.left.equalTo(self.contentView).offset(6);
            make.right.equalTo(self.contentView).offset(-6);
            make.bottom.equalTo(self.contentView.bottom);
        }];
        
        
        
        _sceneBackgroundImageView = [[UIImageView alloc] init];
        _sceneBarNameLable = [[OTLabel alloc] init];
        _sceneBarPhoneNumberLabel = [[OTLabel alloc] init];
        _sceneBarAddressLable = [[OTLabel alloc] init];
        

        _sceneBarNameLable.font = [UIFont boldSystemFontOfSize:16];
        UIImageView *addressImageView = [[UIImageView alloc] init];
        UIImageView *phoneNumberImageView = [[UIImageView alloc] init];
        addressImageView.image = LOADIMAGE(@"zuobiao_icon");
        phoneNumberImageView.image = LOADIMAGE(@"dianhua_icon");
        
        [containerView addSubviews:_sceneBackgroundImageView, _sceneBarNameLable, _sceneBarAddressLable, _sceneBarPhoneNumberLabel, addressImageView, phoneNumberImageView,nil];
        
        [NSObject apply:^(id obj) {
            OTLabel *label = obj;
            label.textColor  = [UIColor colorWithRed:0.490 green:0.494 blue:0.486 alpha:1.000];
            label.font = [UIFont systemFontOfSize:12];
        } forObjects:_sceneBarAddressLable,_sceneBarPhoneNumberLabel, nil];
        
        [_sceneBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(containerView.top);
            make.left.equalTo(containerView.left);
            make.right.equalTo(containerView.right);
            make.height.equalTo(_sceneBackgroundImageView.width).multipliedBy(0.537);
        }];
        
        [_sceneBarNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sceneBackgroundImageView.bottom).offset(10);
            make.left.equalTo(containerView.left).offset(10);
            make.right.equalTo(containerView.right).offset(10);
        }];
        
        [addressImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sceneBarNameLable.bottom).offset(10);
            make.left.equalTo(_sceneBarNameLable.left);
            make.width.equalTo(@15);
            make.height.equalTo(@20);
            make.bottom.equalTo(containerView.bottom).offset(-10);
        }];
        
        [_sceneBarAddressLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(addressImageView.centerY);
            make.left.equalTo(addressImageView.right).offset(5);
            make.width.equalTo(@170);
        }];
        
        [_sceneBarPhoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(addressImageView.centerY);
            make.right.equalTo(containerView.right).offset(19);
            make.width.equalTo(@110);
        }];
        
        [phoneNumberImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(addressImageView.centerY);
            make.right.equalTo(_sceneBarPhoneNumberLabel.left).offset(-5);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        
        
    }
    return self;
}
@end


#pragma mark - SceneTableView

@interface SceneTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SceneTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
//        self.rowHeight = 283;
        self.backgroundColor = [UIColor colorWithRed:0.394 green:0.111 blue:0.212 alpha:1.000];
        self.showsVerticalScrollIndicator = NO;
        self.estimatedRowHeight = 350;
        self.rowHeight = UITableViewAutomaticDimension;

    }
    
    return self;
}

#pragma mark - UITableViewDataSource

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.sceneList.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;//self.sceneList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ExamData *data = self.examList[indexPath.row];
            static NSString *strCellID = @"SceneTableViewCell";
        SceneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellID];
        
        if (!cell) {
            cell = [[SceneTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strCellID];
        }
    
    cell.sceneBarNameLable.text = @"MIX CLUB";
    cell.sceneBackgroundImageView.image = LOADIMAGE(@"jiubatu1_img");
    cell.sceneBarAddressLable.text = @"朝阳区工人体育场西路7号";
    cell.sceneBarPhoneNumberLabel.text = @"18834565678";
//        cell.lblText.text = data.name;
        return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
//{
//    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
//    UIView *containerView = header.contentView;
//    
//    containerView.backgroundColor = [UIColor whiteColor];
//    
//    OTLabel *lblTitle = [OTLabel new];
//    OTLabel *lblProgress = [OTLabel new];
//    self.rightImageView = [UIImageView new];
//    UIView *bottomView = [UIView new];
//    [containerView addSubviews:lblTitle, self.rightImageView, lblProgress, bottomView, nil];
//    
//    ProductExamData *data = self.productExamList[section];
//    lblTitle.text = data.name;
//    lblProgress.text = @"(50%)";
//    
//    
//    ELTapGestureRecognizer *tapGesture = [[ELTapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionItemTapped:)];
//    tapGesture.section = section;
//    [containerView addGestureRecognizer:tapGesture];
//    
//    
//    if (self.sendValue) {
//        self.sendValue(section);
//    }
//    
//    self.rightImageView.image =  self.hasChoosed ? LOADIMAGE(@"xia_icon") : LOADIMAGE(@"xiala_icon");
//    
//    lblTitle.textColor = RGB(80, 80, 80);
//    lblTitle.textInsets = UIEdgeInsetsMake(13, 20.5, 13, 5);
//    lblTitle.font = [UIFont systemFontOfSize:17];
//    lblTitle.numberOfLines = 0;
//    [lblTitle setContentHuggingPriority:UILayoutPriorityRequired
//                                forAxis:UILayoutConstraintAxisVertical];
//    [lblTitle setContentCompressionResistancePriority:UILayoutPriorityRequired
//                                              forAxis:UILayoutConstraintAxisVertical];
//    [lblTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
//    lblProgress.textColor = RGB(80, 80, 80);
//    lblProgress.numberOfLines = 1;
//    lblProgress.textInsets = UIEdgeInsetsMake(18, 5, 13, 5);
//    lblProgress.font = [UIFont systemFontOfSize:14];
//    [lblProgress setContentHuggingPriority:UILayoutPriorityRequired
//                                   forAxis:UILayoutConstraintAxisHorizontal];
//    [lblProgress setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
//    [lblProgress setTranslatesAutoresizingMaskIntoConstraints:NO];
//    
//    bottomView.backgroundColor = RGB(158, 228, 253);
//    
//    [lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.bottom.equalTo(@0);
//        make.right.equalTo(lblProgress.left);
//    }];
//    
//    [lblProgress mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.equalTo(lblTitle);
//        make.left.equalTo(lblTitle.right);
//    }];
//    
//    [self.rightImageView
//     mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.centerY.equalTo(lblTitle.centerY);
//         make.width.height.equalTo(@16);
//         make.right.equalTo(@ - 10);
//     }];
//    
//    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(@0);
//        make.height.equalTo(@5);
//    }];
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 300;
//}

//- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
//{
//    UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
//    UIView *footerView = footer.contentView;
//    
//    [footer addSubview:footerView];
//    
//    footerView.backgroundColor = RGB(158, 228, 253);
//    
//    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(@0);
//    }];
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 3;
}



@end
