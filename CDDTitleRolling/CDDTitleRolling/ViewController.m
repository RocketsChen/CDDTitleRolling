//
//  ViewController.m
//  CDDTitleRolling
//
//  Created by dashen on 2017/11/17.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "ViewController.h"

#import "DCTitleRolling.h"

@interface ViewController ()<CDDRollingDelegate>

/* 京东头条 */
@property (strong , nonatomic)DCTitleRolling *jdRollingView;

/* 国美在线 */
@property (strong , nonatomic)DCTitleRolling *gmRollingView;

/* 淘宝 */
@property (strong , nonatomic)DCTitleRolling *tbRollingView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    
    [self setUpJDRolling];
    
    [self setUpGMRolling];
    
    [self setUpTBRolling];
}

#pragma mark - JD
- (void)setUpJDRolling {

    _jdRollingView = [[DCTitleRolling alloc] initWithFrame:CGRectMake(15, 100, self.view.frame.size.width - 30, 44) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
      
        *rollingTime = 0.2;
        *rolTags = @[@"HOT",@"HOT",@"",@"HOT"];
        *rolTitles = @[@"小丑女的拍照秘籍竟然是？",@"2000热门手机推荐",@"好奇么？点进去哈",@"这套家具比房子还贵"];
        *leftImage = @"shouye_img_toutiao";
        *rightbuttonTitle = @"更多";
        *interval = 3.0;
        *titleFont = 14;
        *titleColor = [UIColor darkGrayColor];
    }];
    
    _jdRollingView.moreClickBlock = ^{
        NSLog(@"jd----more");
    };
    
    [_jdRollingView dc_beginRolling];
    _jdRollingView.layer.cornerRadius = 15;
    [_jdRollingView.layer masksToBounds];
    _jdRollingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_jdRollingView];
}

#pragma mark - GM
- (void)setUpGMRolling
{
    _gmRollingView = [[DCTitleRolling alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 44) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
        
        *rolTags = @[@"object",@"github",@"java/php"];
        *rolTitles = @[@"DCTitleRolling 欢迎留言",@"喜欢的话可以给我点个Star✨✨",@"一门面向对象编程语言"];
        *leftImage = @"shouye_img_toutiao";
        *interval = 3.0;
        *titleFont = 14;
        *titleColor = [UIColor orangeColor];
        *isShowTagBorder = YES;
    }];
    _gmRollingView.delegate = self;
    [_gmRollingView dc_beginRolling];
    _gmRollingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_gmRollingView];
        

}

#pragma mark - TB
- (void)setUpTBRolling
{
    _tbRollingView = [[DCTitleRolling alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 60) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
        
        *rollingTime = 0.2;
        *rightImages = @[@"jshop_sign_layer_not",@"jshop_sign_layer_ok",@"jshop_sign_layer_not"];
        *rollingGroupStyle  = CDDRollingTwoGroup;
        *rolTags = @[@[@"热热",@"爆爆",@"红红"],@[@"冷知识",@"小常识",@"最新"]];
        *rolTitles = @[@[@"喜欢的给个Star",@"苹果X爆冷，黄牛都哭了",@"还在等什么，赶紧抢购"],@[@"有问题欢迎留言~~",@"IOS 11 升级bug出现",@"科技风云惊奇出现等等的等"]];
        *leftImage = @"topTitle";
        *interval = 4.0;
        *titleFont = 14;
        *titleColor = [UIColor blueColor];
        *isShowTagBorder = YES; //是否展示tag边框
        
    }];
    _tbRollingView.delegate = self;
    [_tbRollingView dc_beginRolling];
    _tbRollingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tbRollingView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_jdRollingView dc_endRolling];

//    [_gmRollingView dc_endRolling];
    
//    [_tbRollingView dc_endRolling];
}



#pragma mark - <CDDRollingDelegate>
- (void)dc_RollingViewSelectWithActionAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%zd头条滚动条",index);
}

@end
