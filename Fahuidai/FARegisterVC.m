//
//  FARegisterVC.m
//  Fahuidai
//
//  Created by mortal on 15/9/15.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FARegisterVC.h"
#import "FARegisterTextField.h"
@interface FARegisterVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic)NSMutableArray *array;
@end

@implementation FARegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = BackGroundColor;
    self.scrollView.backgroundColor = BackGroundColor;
    self.array = [NSMutableArray array];
    [self createNormalRegister];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 普通用户注册
- (void)createNormalRegister{
    [self addTextFieldWithTitle:@"用户名:" placeHolder:@"输入用户名" offSety:5];
    [self addTextFieldWithTitle:@"密码:" placeHolder:@"输入密码" offSety:55];
    [self addTextFieldWithTitle:@"确认密码:" placeHolder:@"确认密码" offSety:105];
    [self addTextFieldWithTitle:@"手机号码:" placeHolder:@"输入手机号码" offSety:155];
    [self addTextFieldWithTitle:@"手机验证码:" placeHolder:@"短信验证码" offSety:205];
    [self addTextFieldWithTitle:@"常用邮箱:" placeHolder:@"输入电子邮箱" offSety:255];
    [self addTextFieldWithTitle:@"推荐人:" placeHolder:@"推荐人，可不填" offSety:305];
    
    CGFloat m = (ScreenSize.width -230)/2;
    
    UISwitch *sw = [[UISwitch alloc]initWithFrame:CGRectMake(m, 355, 40, 20)];
    [self.scrollView addSubview:sw];
    
    UIButton *protocol = [[UIButton alloc]initWithFrame:CGRectMake(m+50, 355, 180, 30)];
    [protocol setTitle:@"《法汇贷用户注册协议》" forState:UIControlStateNormal];
    [protocol.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [protocol setTitleColor:[UIColor colorWithRed:0 green:91/255.f blue:255/255.f alpha:1] forState:UIControlStateNormal];
    [protocol addTarget:self action:@selector(showProtocol) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:protocol];
    
    UIButton *registBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 400, ScreenSize.width-20, 44)];
    [registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registBtn setTitle:@"申请注册" forState:UIControlStateNormal];
    [registBtn setBackgroundImage:[UIImage imageNamed:@"圆角矩形-5"] forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(doRegist) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:registBtn];
    self.scrollView.contentSize = CGSizeMake(ScreenSize.width, 400+44+10);
    
}
//律师用户注册
- (void)createLawerRegister{

}
- (void)addTextFieldWithTitle:(NSString *)title placeHolder:(NSString *)placeHolder offSety:(CGFloat)y{
    FARegisterTextField *textFild = [FARegisterTextField textFieldWithTitle:title placeHolder:placeHolder offSety:y];
    [self.array addObject:textFild];
    
    
    [self.scrollView addSubview:textFild];
    
    
}
//展示协议
- (void)showProtocol{
    debugLog(@"查看注册协议");
}
//执行注册
- (void)doRegist{
    debugLog(@"提交注册");
}

@end
