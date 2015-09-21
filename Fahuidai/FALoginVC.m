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
#import "FATextField.h"
@interface FALoginVC ()<UITextFieldDelegate>

@property (strong,nonatomic) FAAccountBaseVC *nextVC;
@property (weak, nonatomic) IBOutlet FATextField *userNameField;
@property (weak, nonatomic) IBOutlet FATextField *passWordField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (assign,nonatomic) BOOL flage;
@property (assign,nonatomic) CGFloat y;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;

@end

@implementation FALoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"用户登录";
    
    // Do any additional setup after loading the view from its nib.
    UIImageView *userImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_user"]];
    //userImage.frame = CGRectMake(0, 0, 35, 35);
    self.userNameField.leftView = userImage;
    self.userNameField.leftViewMode=UITextFieldViewModeAlways;
    
    UIImageView *passWordImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_password"]];
    //userImage.frame = CGRectMake(0, 0, 35, 35);
    self.passWordField.leftView = passWordImage;
    self.passWordField.leftViewMode=UITextFieldViewModeAlways;
    
    self.userNameField.delegate = self;
    self.passWordField.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)dealloc{
    
    //移除键盘监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (textField.returnKeyType == UIReturnKeyNext) {
        [self.passWordField becomeFirstResponder];
    }
    if (textField.returnKeyType == UIReturnKeySend) {
        //相当于点击登录
        
        
        
        
    }
    self.flage = NO;
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
   
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{

}

- (void)keyboardShow:(NSNotification *)note {
    
    
    NSDictionary *info = [note userInfo];
    
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGFloat maxY = ScreenSize.height - kbSize.height;
    
    CGFloat textFieldMaxY = CGRectGetMaxY(self.passWordField.frame);
    
    CGFloat y = textFieldMaxY - maxY;
    
    if (y>0) {
        self.scrollView.contentSize = CGSizeMake(ScreenSize.width, ScreenSize.height +y);
        [self.scrollView scrollRectToVisible:self.passWordField.frame animated:NO];
    }
    
}
- (void)keyboardHide:(NSNotification *)note {
    self.scrollView.contentSize = CGSizeMake(ScreenSize.width, ScreenSize.height - 44);
}

@end
