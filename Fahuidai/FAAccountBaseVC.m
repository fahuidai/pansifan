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
    UIToolbar *bar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, ScreenSize.width, 44)];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5,5, 35, 35)];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"CLOSE"] forState:UIControlStateNormal];
    [bar addSubview:btn];
    [self.view addSubview:bar];
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"矩形-1"]];
    self.view.backgroundColor = color;
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
