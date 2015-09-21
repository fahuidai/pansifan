//
//  FABidDetailVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FABidDetailVC.h"

@interface FABidDetailVC ()

@end

@implementation FABidDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"投标";
    // Do any additional setup after loading the view from its nib.
    UIButton *btnShare = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [btnShare setTitle:@"分享" forState:UIControlStateNormal];
    [btnShare addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btnShare];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)share{

}
@end
