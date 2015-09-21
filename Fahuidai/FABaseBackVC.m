//
//  FABaseBackVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/21.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FABaseBackVC.h"

@interface FABaseBackVC ()

@end

@implementation FABaseBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 40)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Back"] forState:UIControlStateNormal];
    
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
