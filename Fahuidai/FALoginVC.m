//
//  FALoginVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/15.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FALoginVC.h"
#import "FARegisterVC.h"
#import "FAGetBackPwVC.h"
#import "AccountUtil.h"

@interface FALoginVC ()

@property (strong,nonatomic) FAAccountBaseVC *nextVC;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;

@end

@implementation FALoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//登陆

- (IBAction)login:(UIButton *)sender {
    
    
    [AccountUtil saveAccount:self.userNameField.text];
    [AccountUtil savePicPwString:nil];
    
}

//转入注册页面
- (IBAction)register:(UIButton *)sender {
    
    FARegisterVC *registerVC = [[FARegisterVC alloc]init];
   
    self.nextVC = registerVC;
    [self.view addSubviewFromBottom:registerVC.view];
}
//转入密码找回页面
- (IBAction)getBackPSW:(UIButton *)sender {
    FAGetBackPwVC *getBackPwVC = [[FAGetBackPwVC alloc]init];
    self.nextVC = getBackPwVC;
    [self.view addSubviewFromBottom:getBackPwVC.view];
    
}

@end
