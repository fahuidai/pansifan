//
//  FAUserDetailVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FAUserDetailVC.h"
#import "ControllerActivity.h"
@interface FAUserDetailVC ()

@end

@implementation FAUserDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的账户";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//充值
- (IBAction)recharge:(UIButton *)sender {
    
}

//提现
- (IBAction)withdraw:(UIButton *)sender {
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
