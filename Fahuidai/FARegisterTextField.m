//
//  FARegisterTextField.m
//  Fahuidai
//
//  Created by mortal on 15/10/8.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FARegisterTextField.h"
#define Count 5
@interface FARegisterTextField()
@property (strong,nonatomic)NSTimer *timer;
@property (assign,nonatomic)NSInteger time;
@property (weak,nonatomic)UIButton *btn;
@end
@implementation FARegisterTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)textFieldWithTitle:(NSString *)title placeHolder:(NSString *)placeHolder offSety:(CGFloat)y{
    
    FARegisterTextField *textView = [[FARegisterTextField alloc]init];
    textView.time = Count;
    textView.backgroundColor = [UIColor whiteColor];
    textView.frame = CGRectMake(5, y, ScreenSize.width-10, 44);
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 85, 34)];
    titleLabel.text = title;
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    [titleLabel setFont:[UIFont systemFontOfSize:16]];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(95, 5, ScreenSize.width-95-10, 34)];
    textField.placeholder = placeHolder;
    [textField setFont:[UIFont systemFontOfSize:15]];
    [textView addSubview:textField];
    [textView addSubview:titleLabel];
    
    if ([title isEqualToString:@"手机验证码:"]) {
        textField.frame = CGRectMake(95, 5, ScreenSize.width-95-75, 34);
        UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(ScreenSize.width-10-5-70, 5, 70, 34)];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitle:@"发送" forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"圆角矩形-5"] forState:UIControlStateNormal];
        
        [btn addTarget:textView action:@selector(sendMSG:) forControlEvents:UIControlEventTouchUpInside];
        [textView addSubview:btn];
        textView.btn = btn;
    }
    
    return textView;
}

- (void)sendMSG:(UIButton *)btn{
    self.btn.enabled = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCount) userInfo:nil repeats:YES];
    [self.btn setTitle:[NSString stringWithFormat:@"%ds",self.time] forState:UIControlStateNormal];
}
- (void)timeCount{
    
    self.time -=1;
    [self.btn setTitle:[NSString stringWithFormat:@"%ds",self.time] forState:UIControlStateNormal];
    if (self.time == 0) {
        [self.timer invalidate];
        self.timer = nil;
        self.time = Count;
        [self.btn setTitle:@"重新发送" forState:UIControlStateNormal];
        self.btn.enabled = YES;
    }
}
@end
