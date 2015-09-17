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
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 80, 80, 44)];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [self.view addSubview:btn];
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

@end
