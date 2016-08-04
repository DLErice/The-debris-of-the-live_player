//
//  EventDetailTitleView.m
//  Plan_B
//
//  Created by DLErice on 16/5/25.
//  Copyright © 2016年 DLErice. All rights reserved.
//

#import "EventDetailTitleView.h"


#pragma mark - EventSpeciallyInviteSingerModel
@implementation EventSpeciallyInviteSingerModel


@end

#pragma mark - SpeciallyInviteSingerImageView

@interface SpeciallyInviteSingerImageView : UIView

@end

@implementation SpeciallyInviteSingerImageView

- (instancetype)initWintSingerImage:(UIImage *)singerImage singerName:(NSString *)singerName isBigV:(BOOL)isBigV
{
    self = [super init];
    if (self) {

        UIImageView *singerImgView = [UIImageView new];
        UILabel *singerNameLable = [UILabel new];
        UIImageView *bigVImageVIew = [UIImageView new];
        bigVImageVIew.image = LOADIMAGE(@"dibiao_image");
        singerImgView.image = singerImage;
        singerNameLable.text = singerName;
        singerNameLable.textColor = [UIColor whiteColor];
        singerNameLable.font = [UIFont systemFontOfSize:15];
        singerNameLable.textAlignment = NSTextAlignmentCenter;
        
        [singerImgView addSubview:bigVImageVIew];
        [self addSubviews:singerImgView, singerNameLable, nil];
        
        [bigVImageVIew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(singerImgView.bottom);
            make.right.equalTo(singerImgView.right);
            make.width.equalTo(singerImgView.width).dividedBy(3);
            make.height.equalTo(bigVImageVIew.width);
        }];
        @weakify(self);
        [singerNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
            make.height.equalTo(@30);
            make.top.equalTo(singerImgView.bottom);
        }];

        
        [singerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.top.equalTo(self.top);
            make.height.equalTo(singerImgView.width);
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
        }];

            bigVImageVIew.hidden = !isBigV;
    }
    return self;
}

@end

#pragma mark - EventSpeciallyInviteSingerScrollView

@implementation EventSpeciallyInviteSingerScrollView
- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self);
        self.SetSpeciallyInviteSingerBlock = ^(NSArray<EventSpeciallyInviteSingerModel*> *modelArray){
            @strongify(self);
            
            
            self.delegate = self;

            SpeciallyInviteSingerImageView * leftSingerImgView = nil;
            for (EventSpeciallyInviteSingerModel *model in modelArray) {
                
                SpeciallyInviteSingerImageView * singerImgView = [[SpeciallyInviteSingerImageView alloc] initWintSingerImage:model.singerImage singerName:model.singerName isBigV:model.isBigV];

                
                [self addSubview:singerImgView];
            
                [singerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                    if (leftSingerImgView) {
                        make.left.equalTo(leftSingerImgView.right).offset(50);
                    }else{
                        make.left.equalTo(@50);
                    }
                    make.width.height.equalTo(@60);
                    make.top.equalTo(self.top).offset(10);
                }];
                
                  leftSingerImgView = singerImgView;
            
            }
            
            self.contentSize = CGSizeMake(60* modelArray.count + 50, 60);
            
        };
    }
    return self;
}

@end

#pragma mark - EventParticipatePeopleScrollView
@implementation EventParticipatePeopleScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        @weakify(self);
        self.SetPeopleImageBlock = ^(NSArray<UIImage *> *imgArray){
            @strongify(self);
            
            UIImageView *leftImageView = nil;
            for (UIImage * img in imgArray) {

                UIImageView *imageView = [UIImageView new];
                imageView.image = img;
                [self addSubview:imageView];
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    if (leftImageView) {
                        make.left.equalTo(leftImageView.right).offset(15);
                    }else{
                        make.left.equalTo(@15);
                    }
                    make.width.height.equalTo(@40);
                    make.top.equalTo(self.top).offset(10);
                    
                }];
                
                leftImageView = imageView;
            }
        
            self.contentSize = CGSizeMake(60* imgArray.count  +15, 100);
        };
 
    }
    return self;
}

@end

#pragma mark - EventDetailTitleView
@implementation EventDetailTitleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.106 green:0.118 blue:0.137 alpha:1.000];
        
        UILabel *titleLable = [UILabel new];
        titleLable.textColor = [UIColor whiteColor];
        titleLable.font = [UIFont boldSystemFontOfSize:16];
        
        self.SetTitleBlock = ^(NSString * title){
            titleLable.text = title;
        };
        
        [self addSubview:titleLable];
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@40);
            make.left.equalTo(self.left).offset(15);
            make.right.equalTo(self.right).offset(10);
            make.top.equalTo(self.top);
        }];
        
        
    }
    return self;
}

@end
