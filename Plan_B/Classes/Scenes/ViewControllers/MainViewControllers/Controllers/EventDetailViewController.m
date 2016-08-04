//
//  EventDetailViewController.m
//  Plan_B
//
//  Created by DLErice on 16/5/23.
//  Copyright © 2016年 DLErice. All rights reserved.
//



#import "EventDetailViewController.h"
#import "EventDetailTitleView.h"

@interface EventDetailViewController ()<UIScrollViewDelegate>
//@property (nonatomic, strong) UIView *alphaView;
@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    CGRect frame = self.navigationController.navigationBar.frame;
    
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, frame.size.width, frame.size.height+20)];
    
    alphaView.backgroundColor = [UIColor colorWithRed:0.118 green:0.125 blue:0.157 alpha:1.000];
    
    alphaView.userInteractionEnabled = NO;
    
    [self.navigationController.navigationBar insertSubview: alphaView atIndex:0];
    
    @weakify(self);
    self.willAppearBlock = ^(BOOL isAppear){
         @strongify(self);
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.translucent = YES;
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    };
    
    self.willDisappearBlock = ^(BOOL isDisappear){
        @strongify(self);
        self.navigationController.navigationBar.translucent = NO;
        [alphaView removeFromSuperview];
    };
    
    self.scrollContentSetBlock = ^(CGPoint contentOfSet){
        if (contentOfSet.y <= 210) {
            CGFloat alph = 64 + contentOfSet.y;
            if (alph <= 64) {
                alphaView.alpha = alph/64 -0.3;
            }
        }
    };
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:LOADIMAGE(@"butn_fanhui") style:(UIBarButtonItemStylePlain) target:self action:@selector(didClickLeftBackButtonItem)];
    
    UIButton *addButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    addButton.backgroundColor = [UIColor colorWithRed:0.898 green:0.690 blue:0.251 alpha:1.000];
    [addButton setTitle:@"我想去参加" forState:UIControlStateNormal];
    [self.view addSubview:addButton];
    
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.height.equalTo(@40);
    }];
}

-(void)didClickLeftBackButtonItem {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildScrollViewSubview:(UIView *)scrollView controller:(BaseViewController *)viewController {
    scrollView.backgroundColor = [UIColor colorWithRed:0.075 green:0.078 blue:0.094 alpha:1.000];

    UIImageView * singerIntroduceImg = [UIImageView new];
    
    UIView *eventTitleView = [UIView new];
    UILabel *barNameLable = [UILabel new];
    UILabel *barAddressLable = [UILabel new];
    UILabel *startTimeLable = [UILabel new];
    

    EventDetailTitleView *titleView_singer = [EventDetailTitleView new];
    titleView_singer.SetTitleBlock(@"特邀歌手");
    EventSpeciallyInviteSingerScrollView *inviteSingerView = [EventSpeciallyInviteSingerScrollView new];
    
 
    
    EventDetailTitleView *titleView_event = [EventDetailTitleView new];
    titleView_event.SetTitleBlock(@"活动说明");
    UILabel *eventExplainLable = [UILabel new];
    eventExplainLable.numberOfLines = 0;
    [eventExplainLable setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [eventExplainLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [eventExplainLable setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    EventDetailTitleView *titleView_addPeople = [EventDetailTitleView new];
    titleView_addPeople.SetTitleBlock(@"已有500人报名参加此活动");
    EventParticipatePeopleScrollView *eventAddPoepleView = [EventParticipatePeopleScrollView new];
    

    

    
    [NSObject apply:^(id obj) {
        UILabel *label = obj;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
    } forObjects:barNameLable, barAddressLable, startTimeLable, nil];
    
    [NSObject apply:^(id obj) {
        UILabel *label = obj;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithWhite:0.713 alpha:1.000];
    } forObjects: barAddressLable, startTimeLable, eventExplainLable,nil];
    
    barNameLable.font = [UIFont boldSystemFontOfSize:17];
    
    [eventTitleView addSubviews:barNameLable, barAddressLable, startTimeLable, nil];

    
    
    
    
    
    
    [scrollView addSubviews:singerIntroduceImg, eventTitleView, titleView_singer, inviteSingerView, titleView_event, eventExplainLable, titleView_addPeople, eventAddPoepleView, nil];
    
    [singerIntroduceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(scrollView);
        make.height.equalTo(@200);
        make.top.equalTo(scrollView.top).offset(-64);
        make.left.equalTo(scrollView.left);
    }];
    
    [eventTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(scrollView);
        make.height.equalTo(@100);
        make.top.equalTo(singerIntroduceImg.bottom);
        make.left.equalTo(scrollView.left);
    }];
    
    [barNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(scrollView.width);
        make.height.equalTo(@30);
        make.top.equalTo(eventTitleView.top).offset(10);
        make.left.equalTo(eventTitleView.left);
    }];
    
    [barAddressLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(scrollView.width);
        make.height.equalTo(@30);
        make.top.equalTo(barNameLable.bottom).offset(-8);
        make.left.equalTo(eventTitleView.left);
    }];
    
    [startTimeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(scrollView.width);
        make.height.equalTo(@30);
        make.top.equalTo(barAddressLable.bottom).offset(-8);
        make.left.equalTo(eventTitleView.left);
    }];
    
    [titleView_singer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView.left);
        make.right.equalTo(scrollView.right);
        make.top.equalTo(eventTitleView.bottom);
        make.height.equalTo(@40);
    }];
    
    [inviteSingerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView.left);
        make.right.equalTo(scrollView.right);
        make.top.equalTo(eventTitleView.bottom).offset(40);
        make.height.equalTo(@100);
    }];
    
    [titleView_event mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView.left);
        make.right.equalTo(scrollView.right);
        make.top.equalTo(inviteSingerView.bottom);
        make.height.equalTo(@40);
    }];
    
    [eventExplainLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView.left).offset(8);
        make.right.equalTo(scrollView.right).offset(-8);
        make.top.equalTo(titleView_event.bottom).offset(8);
        
    }];

    [titleView_addPeople mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView.left);
        make.right.equalTo(scrollView.right);
        make.top.equalTo(eventExplainLable.bottom).offset(8);
        make.height.equalTo(@40);
    }];
    
    [eventAddPoepleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scrollView.left);
        make.right.equalTo(scrollView.right);
        make.top.equalTo(titleView_addPeople.bottom);
        make.height.equalTo(@140);

    }];
    
//    UIView *bottomView = [UIView new];
//    [scrollView addSubview:bottomView];
//    
//    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(scrollView);
//        make.height.equalTo(@900);
//        make.top.equalTo(singerIntroduceImg.top);
//        make.left.equalTo(scrollView.left);
//    }];
    
    
    
    
    self.lastBottomView = eventAddPoepleView;
    
    
    singerIntroduceImg.image = LOADIMAGE(@"bannner");
    barNameLable.text = @"后海一号酒吧";
    barAddressLable.text = @"地址：北京市朝阳区什刹海5号";
    startTimeLable.text = @"开始时间： 8:00";
    
    eventExplainLable.text = @"1、从前从前有个人爱你很久，但偏偏风渐渐把距离吹得好远，好不容易又能再多爱一天，但故事的最后你好像还是说了拜拜。——《晴天》\n2、我用漂亮的押韵，形容被掠夺一空的爱情；我用凄美的字型，描绘后悔莫及的那爱情。——《夜曲》\n3、我一路向北，离开有你的季节，你说你好累，已无法再爱上谁。风在山路吹，过往的画面全都是不对，细数惭愧，我伤你几回。——《一路向北》\n4、断了的弦再怎么连，我的感觉你已听不见，你的转变像断掉的弦，再怎么接音都不对，你的改变我能够分辨。——《断了的弦》\n5、我想我是太过依赖，在挂电话的刚才，坚持学单纯的小孩，静静看守这份爱，知道不能太依赖，怕你会把我宠坏，你的香味一直徘徊，我舍不得离开。——《你听得到》\n6、转身离开，分手说不出来，海鸟跟鱼相爱，只是一场意外。——《珊瑚海》\n7、听妈妈的话别让她受伤，想快快长大才能保护她，美丽的白发幸福总发芽，天使的魔法温暖中慈祥。——《听妈妈的话》\n8、我会发着呆然后忘记你，接着紧紧闭上眼，想着那一天会有人代替，让我不再想念你。——《轨迹》";
    
    EventSpeciallyInviteSingerModel * model_1 = [EventSpeciallyInviteSingerModel new];
    model_1.singerImage = LOADIMAGE(@"geshou_image1");
    model_1.singerName = @"李倩";
    model_1.isBigV = YES;
    EventSpeciallyInviteSingerModel * model_2 = [EventSpeciallyInviteSingerModel new];
    model_2.singerImage = LOADIMAGE(@"geshou_image_2");
    model_2.singerName = @"庾澄庆";
    model_2.isBigV = YES;
    EventSpeciallyInviteSingerModel * model_3 = [EventSpeciallyInviteSingerModel new];
    model_3.singerImage = LOADIMAGE(@"geshou_image_3");
    model_3.singerName = @"尚雯婕";
    model_3.isBigV = YES;
    
    NSArray * modelArray = @[model_1, model_2, model_3];
    
    inviteSingerView.SetSpeciallyInviteSingerBlock(modelArray);
    
    UIImage *img_1 = LOADIMAGE(@"huodong_ren_image_1");
    UIImage *img_2 = LOADIMAGE(@"huodong_ren_image_2");
    UIImage *img_3 = LOADIMAGE(@"huodong_ren_image_3");
    UIImage *img_4 = LOADIMAGE(@"huodong_ren_image_4");
    UIImage *img_5 = LOADIMAGE(@"huodong_ren_image_5");
    UIImage *img_6 = LOADIMAGE(@"huodong_ren_image_6");
    NSArray *peopleImgArray = @[img_1, img_2, img_3, img_4, img_5, img_6,];
    eventAddPoepleView.SetPeopleImageBlock(peopleImgArray);
    
}




//-(void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]]; 
//    
//}

@end
