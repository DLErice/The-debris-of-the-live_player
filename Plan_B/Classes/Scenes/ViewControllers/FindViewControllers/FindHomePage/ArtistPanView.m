//
//  ArtistPanView.m
//  Plan_B
//
//  Created by DLErice on 16/6/20.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "ArtistPanView.h"

#pragma mark - ArtistPanModel

@implementation ArtistPanModel

#pragma mark - Conversions



@end


#pragma mark - ArtistPanelCell

@interface ArtistPanelCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *artistImageView;
@property (nonatomic, strong) OTLabel *artistNameLabel;
@property (nonatomic, strong) UIButton *attentionButton;
@property (nonatomic, strong) OTLabel *attentionNumberLable;

@property (nonatomic, strong) UIView * view;
@end

@implementation ArtistPanelCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIView *containerBgView = [UIView new];
        [self.contentView addSubview:containerBgView];
        [containerBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        UIView *containerView = [UIView new];
        containerView.layer.cornerRadius = 5.0f;
        containerView.layer.borderWidth = 1.0f;
        containerView.layer.borderColor = [UIColor colorWithRed:0.749 green:0.757 blue:0.761 alpha:0.500].CGColor;
        containerView.layer.masksToBounds = YES;
        [containerBgView addSubview:containerView];
        [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    
        
        
        _artistImageView = [UIImageView new];
        _attentionButton = [[UIButton alloc] init];
        _attentionNumberLable = [OTLabel new];
        _artistNameLabel = [OTLabel new];
        
                _artistNameLabel.text = @"Angelababy";
        _artistImageView.image = LOADIMAGE(@"yiren3_img");
        _attentionNumberLable.text = @"2344已关注";


        
        
        [_attentionButton addTarget:self action:@selector(didClickAttentionButton:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [_attentionButton setTitleColor:RGB(108, 108, 107) forState:(UIControlStateNormal)];
        [_attentionButton setTitle:@"已关注" forState:(UIControlStateNormal)];
        _attentionButton.titleLabel.font = [UIFont boldSystemFontOfSize: 13.0];
        _attentionButton.layer.cornerRadius = 5.0f;
        _attentionButton.layer.borderWidth = 1.0f;

        _attentionButton.layer.masksToBounds = YES;
        
        _attentionButton.selected = NO;
        
        if (_attentionButton.selected) {
            _attentionButton.layer.borderColor = [UIColor colorWithRed:0.424 green:0.424 blue:0.420 alpha:1.000].CGColor;
        } else {
            _attentionButton.layer.borderColor = [UIColor colorWithRed:0.424 green:0.424 blue:0.420 alpha:0.000].CGColor;
        }
        
        self.view = [UIView new];
        self.view.backgroundColor = [UIColor colorWithRed:0.890 green:0.690 blue:0.255 alpha:1.000];
        self.view.userInteractionEnabled = NO;
        
        UIImageView *imgView = [UIImageView new];
        UILabel *label = [UILabel new];
        imgView.image = LOADIMAGE(@"guanzhu_icon_find");
        label.text = @"关注";
        label.textColor = [UIColor colorWithRed:0.996 green:0.992 blue:0.992 alpha:1.000];
        label.font = [UIFont boldSystemFontOfSize:13.0];
        
        [self.view addSubviews:imgView, label, nil];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.view.height).offset(-15);
            make.width.equalTo(self.view.height).offset(-15);
            make.top.equalTo(self.view.top).offset(7.5);
            make.left.equalTo(self.view.left).offset(7.5);
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.right).offset(3);
            make.top.equalTo(self.view.top);
            make.bottom.equalTo(self.view.bottom);
            make.right.equalTo(self.view.right);
        }];
        
        
        [_attentionButton addSubview:self.view];
        
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_attentionButton);
        }];

        self.view.hidden = _attentionButton.selected;
        
        _artistNameLabel.textAlignment = NSTextAlignmentCenter;
        _artistNameLabel.textColor = RGB(254, 253, 253);
        _artistNameLabel.font = [UIFont boldSystemFontOfSize:18];
        _artistNameLabel.backgroundColor = [UIColor colorWithPatternImage:LOADIMAGE(@"fuceng_img")];

        
        _attentionNumberLable.textAlignment = NSTextAlignmentCenter;
        _attentionNumberLable.textColor = RGB(102, 102, 102);
        _attentionNumberLable.font = [UIFont systemFontOfSize:14];

        [containerView addSubviews:_artistImageView, _attentionButton, _attentionNumberLable, nil];
        [_artistImageView addSubview:_artistNameLabel];
        
        [_artistImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(containerView.width);
            make.height.equalTo(containerView.width);
            make.top.equalTo(containerView.top);
            make.left.equalTo(containerView.left);
        }];
        
        [_artistNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(_artistImageView.width);
            make.height.equalTo(@30);
            make.bottom.equalTo(_artistImageView.bottom).offset(8);
            make.left.equalTo(_artistImageView.left);
        }];
        
        [_attentionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_artistImageView.centerX);
            make.top.equalTo(_artistImageView.bottom).offset(20);
            make.width.equalTo(@60);
            make.height.equalTo(@30);
        }];
        
        [_attentionNumberLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_artistImageView.centerX);
            make.top.equalTo(_attentionButton.bottom).offset(5);
            make.width.equalTo(@100);
//            make.height.equalTo(@30);
            make.bottom.equalTo(containerView.bottom).offset(-10);
        }];
        
    
    }
    
    return self;
}

- (void)didClickAttentionButton:(UIButton *)sender {

    self.view.hidden = !sender.selected;
    
    if (_attentionButton.selected) {
        _attentionButton.layer.borderColor = [UIColor colorWithRed:0.424 green:0.424 blue:0.420 alpha:0.000].CGColor;
    } else {
        _attentionButton.layer.borderColor = [UIColor colorWithRed:0.424 green:0.424 blue:0.420 alpha:1.000].CGColor;
    }
    
    sender.selected = !sender.selected;

}

//- (void)setHighlighted:(BOOL)highlighted
//{
//    [super setHighlighted:highlighted];
//    
//    _name.textColor = highlighted ? RGB(200, 100, 200) : THEME_BLANK_COLOR;
//}

//#pragma mark -

- (void)loadWithModel:(ArtistPanModel *)model
{
//    self.name.text = model.title;
//    
//    if (model.imageURL) {
//        self.iconImageView.image = LOADIMAGE(model.imageURL);
//    }
}

@end


@implementation ArtistPanView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithCellType:[ArtistPanelCell class]]) {
        @weakify(self);
        self.showsVerticalScrollIndicator = NO;
        self.configCellBlock = ^(UICollectionViewCell *cell, NSIndexPath *indexPath) {
            @strongify(self);
            
            ArtistPanelCell *panel = (__kindof UICollectionViewCell *)cell;
            [panel loadWithModel:self.dataItems[indexPath.row]];
        };
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
