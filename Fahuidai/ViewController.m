//
//  ViewController.m
//  QQSlideMenu
//
//  Created by wamaker on 15/6/10.
//  Copyright (c) 2015年 wamaker. All rights reserved.
//

#import "ViewController.h"
#import "FAHomeVC.h"
#import "FAMenuVC.h"
#import "WMNavigationController.h"
#import "WMCommon.h"
#import "FAUserDetailVC.h"
#import "FAMakebidVC.h"
#import "FAMoreVC.h"
#import "AccountUtil.h"
#import "FALoginVC.h"
#import "IMPassWordView.h"
typedef enum state {
    kStateHome,
    kStateMenu
}state;

static const CGFloat viewSlideHorizonRatio = 0.75;
static const CGFloat viewHeightNarrowRatio = 0.80;
static const CGFloat menuStartNarrowRatio  = 0.70;

@interface ViewController () <FAMenuVCDelegate,IMPassWordViewDelegate>
@property (assign, nonatomic) state   sta;              // 状态(Home or Menu)
@property (assign, nonatomic) CGFloat distance;         // 距离左边的边距
@property (assign, nonatomic) CGFloat leftDistance;
@property (assign, nonatomic) CGFloat menuCenterXStart; // menu起始中点的X
@property (assign, nonatomic) CGFloat menuCenterXEnd;   // menu缩放结束中点的X
@property (assign, nonatomic) CGFloat panStartX;        // 拖动开始的x值

@property (strong, nonatomic) WMCommon  *common;
@property (strong, nonatomic) FAHomeVC  *homeVC;
@property (strong, nonatomic) FAMenuVC  *menuVC;
@property (strong, nonatomic) WMNavigationController *messageNav;
@property (strong, nonatomic) UIView                 *cover;


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.common = [WMCommon getInstance];
    self.sta = kStateHome;
    self.distance = 0;
    self.menuCenterXStart = self.common.screenW * menuStartNarrowRatio / 2.0;
    self.menuCenterXEnd = self.view.center.x;
    self.leftDistance = self.common.screenW * viewSlideHorizonRatio;
    
    // 设置背景
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
    bg.frame  = [[UIScreen mainScreen] bounds];
    [self.view addSubview:bg];
    
    // 设置menu的view
    self.menuVC = [[FAMenuVC alloc] init];
    self.menuVC.delegate = self;
    self.menuVC.view.frame = [[UIScreen mainScreen] bounds];
    self.menuVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuStartNarrowRatio, menuStartNarrowRatio);
    self.menuVC.view.center = CGPointMake(self.menuCenterXStart, self.menuVC.view.center.y);
    [self.view addSubview:self.menuVC.view];
    
//     //设置遮盖
//    self.cover = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    //self.cover.alpha = 0.5;
//    self.cover.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:self.cover];
    
    // 添加messageNav
    //self.messageNav = [[_messageNav alloc] init];
    
    self.homeVC = [[FAHomeVC alloc] init];
    
    
    self.homeVC.view.frame = [[UIScreen mainScreen] bounds];
    //self.homeVC.delegate = self;
    
    // 设置控制器的状态，添加手势操作
    self.messageNav = [[WMNavigationController alloc] initWithRootViewController:self.homeVC];
//    self.messageNav.navigationBar.barTintColor = [UIColor colorWithRed:0 green:122.0 / 255 blue:1.0 alpha:1.0];
//    self.messageNav.navigationBar.tintColor = [UIColor whiteColor];
//    [self.messageNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
//    self.messageNav.tabBarItem.title = @"消息";
    //self.messageNav.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor"];
//    
//    [self.messageNav addChildViewController:self.messageNav];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//    [self.messageNav.view addGestureRecognizer:pan];
//    [self.view addSubview:self.messageNav.view];
    [self.messageNav.view addGestureRecognizer:pan];
    [self.view addSubview:self.messageNav.view];
}

/**
 *  设置statusbar的状态
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/**
 *  处理拖动事件
 *
 *  @param recognizer
 */
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    // 当滑动水平X大于75时禁止滑动
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.panStartX = [recognizer locationInView:self.view].x;
    }
    if (self.sta == kStateHome && self.panStartX >= 75) {
        return;
    }
    
    CGFloat x = [recognizer translationInView:self.view].x;
    // 禁止在主界面的时候向左滑动
    if (self.sta == kStateHome && x < 0) {
        return;
    }
    
    CGFloat dis = self.distance + x;
    // 当手势停止时执行操作
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (dis >= self.common.screenW * viewSlideHorizonRatio / 2.0) {
            [self showMenu];
        } else {
            [self showHome];
        }
        return;
    }
    
    CGFloat proportion = (viewHeightNarrowRatio - 1) * dis / self.leftDistance + 1;
    if (proportion < viewHeightNarrowRatio || proportion > 1) {
        return;
    }
    self.messageNav.view.center = CGPointMake(self.view.center.x + dis, self.view.center.y);
    self.messageNav.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion);
    
    self.cover.alpha = 1 - dis / self.leftDistance;
    //NSLog(@"%f",1 - dis / self.leftDistance);
    CGFloat menuProportion = dis * (1 - menuStartNarrowRatio) / self.leftDistance + menuStartNarrowRatio;
    CGFloat menuCenterMove = dis * (self.menuCenterXEnd - self.menuCenterXStart) / self.leftDistance;
    self.menuVC.view.center = CGPointMake(self.menuCenterXStart + menuCenterMove, self.view.center.y);
    self.menuVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuProportion, menuProportion);
}

/**
 *  展示侧边栏
 */
- (void)showMenu {
    self.distance = self.leftDistance;
    self.sta = kStateMenu;
    [self doSlide:viewHeightNarrowRatio];
}

/**
 *  展示主界面
 */
- (void)showHome {
    self.distance = 0;
    self.sta = kStateHome;
    [self doSlide:1];
}

/**
 *  实施自动滑动
 *
 *  @param proportion 滑动比例
 */
- (void)doSlide:(CGFloat)proportion {
    [UIView animateWithDuration:0.3 animations:^{
        self.messageNav.view.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y);
        self.messageNav.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion);
        
//        self.homeVC.leftBtn.alpha = self.cover.alpha = proportion == 1 ? 1 : 0;
        
        CGFloat menuCenterX;
        CGFloat menuProportion;
        if (proportion == 1) {
            menuCenterX = self.menuCenterXStart;
            menuProportion = menuStartNarrowRatio;
        } else {
            menuCenterX = self.menuCenterXEnd;
            menuProportion = 1;
        }
        self.menuVC.view.center = CGPointMake(menuCenterX, self.view.center.y);
        self.menuVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuProportion, menuProportion);
    } completion:^(BOOL finished) {

    }];
}

#pragma mark - WMHomeViewController代理方法
- (void)leftBtnClicked {
    [self showMenu];
}

#pragma mark - WMMenuViewController代理方法
- (void)didSelectItem:(NSString *)title {

    
    
    if ([title isEqualToString:@"home"]) {
        [self.messageNav popToRootViewControllerAnimated:YES];
        [self showHome];
    }else{
        FABaseVC *nextVC;
        
            [self.messageNav popToRootViewControllerAnimated:NO];
            
            if ([title isEqualToString:@"makebid"]&&isLogin) {
                nextVC = [[FAMakebidVC alloc]init];
            }
            if ([title isEqualToString:@"userdetail"]&&isLogin) {
                nextVC = [[FAUserDetailVC alloc]init];
            }
            if ([title isEqualToString:@"more"]) {
            nextVC = [[FAMoreVC alloc]init];
                }
            if (nextVC) {
                [self.messageNav pushViewController:nextVC animated:NO];
                [self showHome];
            }
            else {
                FALoginVC *loginVC = [[FALoginVC alloc]init];
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:loginVC animated:YES completion:nil];
            }
        
    }
    
}
- (void)doForgetPw {
    [self.messageNav popToRootViewControllerAnimated:YES];
    [self showMenu];
    
    
}
@end
