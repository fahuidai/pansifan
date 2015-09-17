//
//  FABaseVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FABaseVC.h"

@interface FABaseVC ()

@end

@implementation FABaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
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
