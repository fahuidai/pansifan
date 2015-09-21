//
//  FAAccountBaseVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/15.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FAAccountBaseVC.h"

@interface FAAccountBaseVC ()

@end

@implementation FAAccountBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, ScreenSize.width, ScreenSize.height);
    UIView *bar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenSize.width, 44)];
    bar.backgroundColor = BaseColor;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10,10, 24, 24)];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"CLOSE"] forState:UIControlStateNormal];
    [bar addSubview:btn];
    [self.view addSubview:bar];
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"矩形-1"]];
    self.view.backgroundColor = color;
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    [title setFont:[UIFont systemFontOfSize:20]];
    [title setTextColor:[UIColor whiteColor]];
    [title setTextAlignment:NSTextAlignmentCenter];
    title.center = bar.center;
    [bar addSubview:title];
    self.titleLabel = title;
    
    //[self prefersStatusBarHidden];
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss{
    if ([self isKindOfClass:NSClassFromString(@"FALoginVC")]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.view removeSelfFromBottom];
    }
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}


@end
