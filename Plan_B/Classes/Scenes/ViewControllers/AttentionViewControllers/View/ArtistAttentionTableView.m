//
//  ArtistAttentionTableView.m
//  Plan_B
//
//  Created by DLErice on 16/6/22.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "ArtistAttentionTableView.h"
#import "SKTagView.h"
#import "HexColors.h"

#pragma mark - ArtistAttentionData

@implementation ArtistAttentionData


@end

#pragma mark - ArtistAttentionTableCell

@interface ArtistAttentionTableCell : UITableViewCell
@property (nonatomic, strong) UIImageView *artistImageView;
@property (nonatomic, strong) OTLabel *artistNameLabel;
@property (nonatomic, strong) UIView *tagView;
@property (nonatomic, strong) OTLabel *artistAttentivedLabel;
@end

@implementation ArtistAttentionTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setSeparatorInset:UIEdgeInsetsZero];
        [self setLayoutMargins:UIEdgeInsetsZero];
        
        UIView *containerView = [UIView new];
        _artistImageView = [UIImageView new];
        _artistNameLabel = [OTLabel new];
        _tagView = [UIView new];
        _artistAttentivedLabel = [OTLabel new];
        UIImageView * artistAttentivedImg = [UIImageView new];
        artistAttentivedImg.image = LOADIMAGE(@"guanzhu_icon");
        
        containerView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:containerView];
        [containerView addSubviews:_artistImageView, _artistNameLabel, _tagView, _artistAttentivedLabel, artistAttentivedImg, nil];
    
        _artistImageView.layer.cornerRadius = 5.0f;
        _artistImageView.layer.masksToBounds = YES;
        _artistNameLabel.font = [UIFont boldSystemFontOfSize:17.0f];
        _artistAttentivedLabel.textColor = [UIColor colorWithWhite:0.600 alpha:1.000];

        
        
        _artistImageView.image = LOADIMAGE(@"head_image5");
        _artistNameLabel.text = @"GALA乐队";
        _artistAttentivedLabel.text = @"123";
        
        _tagView.backgroundColor = [UIColor redColor];
        
        [_artistImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(containerView.top).offset(13);
            make.left.equalTo(containerView.left).offset(11);
            make.bottom.equalTo(containerView.bottom).offset(-13);
            make.width.equalTo(_artistImageView.height);
        }];
        
        [_artistAttentivedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(containerView.top).offset(23);
            make.right.equalTo(containerView.right).offset(-30);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
        }];
        
        [artistAttentivedImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_artistAttentivedLabel.centerY);
            make.right.equalTo(_artistAttentivedLabel.left).offset(-3);
            make.width.equalTo(@15);
            make.height.equalTo(artistAttentivedImg.width);
        }];
        
        [_artistNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(containerView.top).offset(23);
            make.left.equalTo(_artistImageView.right).offset(8);
            make.right.equalTo(artistAttentivedImg.left).offset(-3);
            make.height.equalTo(@30);
        }];
        
        [_tagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(containerView.top).offset(53);
            make.left.equalTo(_artistNameLabel.left);
            make.right.equalTo(containerView.right);
            make.height.equalTo(@30);
        }];
        
        
        [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        [self setupTagView];
    }
    return self;
}


- (void)setupTagView {
    SKTagView * tagOnView  = ({
        SKTagView *view = [SKTagView new];
        view.backgroundColor = [UIColor whiteColor];
        view.padding = UIEdgeInsetsMake(0, 0, 0, 0);
        view.interitemSpacing = 15;
        view.lineSpacing = 10;
        __weak SKTagView *weakView = view;
        view.didTapTagAtIndex = ^(NSUInteger index){
            [weakView removeTagAtIndex:index];
        };
        view;
    });
    [self.tagView addSubview:tagOnView];
    [tagOnView mas_makeConstraints: ^(MASConstraintMaker *make) {
        //        UIView *superView = self.view;
        make.centerY.equalTo(self.tagView.mas_centerY).with.offset(0);
        make.left.equalTo(self.tagView.mas_left).with.offset(0);
        make.right.equalTo(self.tagView.mas_right);
        make.height.equalTo(self.tagView.height);
    }];
    
    //Add Tags
    
    NSArray * array = @[@"我想火", @" 90后 ", @" 民谣 "];
    
    //    [@[@"摇滚摇滚摇滚摇滚摇滚", @"流行", @"通俗"] enumerateObjectsUsingBlock: ^(NSString *text, NSUInteger idx, BOOL *stop) {
    
    NSArray * colorsArray = @[@"#ff7996", @"#fed476", @"#be9eff"];
    
    for (int i = 0; i < 3; i++) {
        
        
        NSString * text = array[i];
        //        UIColor * ffColor = colorsArray[i];
        
        SKTag *tag = [SKTag tagWithText: text];
        tag.textColor = [UIColor hx_colorWithHexString: colorsArray[i]];
        tag.borderColor = tag.textColor;
        tag.borderWidth = 1.0f;
        tag.fontSize = 13;
        //tag.font = [UIFont fontWithName:@"Courier" size:15];
        tag.enable = NO;
        tag.padding = UIEdgeInsetsMake(3, 8, 3, 8);
        tag.bgColor = [UIColor whiteColor];
        tag.cornerRadius = 5;
        [tagOnView addTag:tag];
        //    }];
    }
}


@end

#pragma mark - ArtistAttentionTableView

@interface ArtistAttentionTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ArtistAttentionTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self setSeparatorInset:UIEdgeInsetsZero];
        [self setLayoutMargins:UIEdgeInsetsZero];
        self.showsVerticalScrollIndicator = NO;
        //        self.estimatedRowHeight = 40;
        //        self.rowHeight = UITableViewAutomaticDimension;
        self.backgroundColor = [UIColor clearColor];
        
        self.rowHeight = 100.0f;
    }
    
    return self;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *strCellID = @"ArtistAttentionTableCell";
    ArtistAttentionTableCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellID];
    
    if (!cell) {
        cell = [[ArtistAttentionTableCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strCellID];
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

@end
