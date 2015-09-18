//
//  IMPassWordView.m
//  Fahuidai
//
//  Created by mortal on 15/9/17.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "IMPassWordView.h"
#import "IMRect.h"
#import "AccountUtil.h"
#import "UIView+Animation.h"
#define PointW 70 //圆直径
#define Distance (ScreenSize.width- PointW*3)/4 //圆间距
#define LineColor [UIColor colorWithRed:0 green:210 blue:0 alpha:1] //线颜色
#define FillColor  [UIColor colorWithRed:0 green:210 blue:0 alpha:1]//填充颜色
@interface IMPassWordView()
@property (strong,nonatomic) NSMutableArray *password;
@property (copy ,nonatomic) NSString *passWordString;
@property (assign,nonatomic) CGPoint point;
@property (weak,nonatomic) UILabel *tilte;
@property (weak,nonatomic) UILabel *warn; 
@end
@implementation IMPassWordView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        id vc =[UIApplication sharedApplication].keyWindow.rootViewController;
        //__weak id<IMPassWordViewDelegate> weakvc = vc;
        self.delegate = vc;
        //配置导航栏
        UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, ScreenSize.width, 64)];
        toolBar.backgroundColor = [UIColor blueColor];
        [self addSubview:toolBar];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
        self.tilte = label;
        label.textAlignment = NSTextAlignmentCenter;
        
        label.center = CGPointMake(ScreenSize.width/2, 42);
        
        [toolBar addSubview:label];
        
        
        UILabel *warn = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
        self.warn = warn;
        warn.textAlignment = NSTextAlignmentCenter;
        
        warn.center = CGPointMake(ScreenSize.width/2, (ScreenSize.height/2 - (Distance*2 + PointW*3)/2 - 64)/ 2+64);
        
        self.backgroundColor = [UIColor grayColor];
        self.password = [NSMutableArray array];
        self.passWordString =[AccountUtil getPicPwString];
        self.array = [NSMutableArray array];
        CGFloat x = 0,y = 0;
        for (NSInteger i = 1; i< 10; i++) {
            
            if (i<4) {
                y =ScreenSize.height/2 - (Distance*2 + PointW*3)/2;
                x = Distance + (i-1)*(Distance + PointW);
            }
            if (i>3&& i< 7) {
                y = ScreenSize.height/2 - (Distance*2 + PointW*3)/2 + Distance + PointW;
                x = Distance + (i-4)*(Distance + PointW);
            }
            if (i>6&& i<10) {
                y = ScreenSize.height/2 - (Distance*2 + PointW*3)/2 + 2*(Distance + PointW);
                x = Distance + (i-7)*(Distance + PointW);
            }
            IMRect *rect = [[IMRect alloc]init];
            rect.rect = CGRectMake(x, y, PointW, PointW);
            rect.number = i;
            rect.isSelected = NO;
            [self.array addObject:rect];
            
        }
        if (havePicPw) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(Distance, ScreenSize.height/2 - (Distance*2 + PointW*3)/2 + 2*(Distance + PointW) + PointW +Distance, 100, 40)];
            [btn setTitle:@"忘记手势？" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(forgetPw) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        
    }
    
    return self;
}
/**
 忘记手势
 */
- (void)forgetPw{
    //删除用户，重新登陆
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请重新登录" message:@"登录后可重新设置手势!" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alertView show];
    [AccountUtil saveAccount:nil];
    if (self.delegate) {
        [self.delegate doForgetPw];
    }
    [self removeSelfFromBottom];
    
    self.passBlock();
    //代理方法 在viewContrller中实现
    
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (NSInteger i = 1; i<10; i++) {
        IMRect *re = self.array[i-1];
        CGContextAddEllipseInRect(ctx, re.rect);
    }
    CGContextStrokePath(ctx);
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, LineColor.CGColor);
    //CGContextSetRGBStrokeColor(ctx, 0, 210,0, 1);
    
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    if (self.password.count) {
        
        NSString *first = self.password[0];
        int num = first.intValue;
        IMRect *re =  self.array[num -1];
        
        CGPoint point = CGPointMake(re.rect.origin.x+re.rect.size.width/2, re.rect.origin.y+re.rect.size.height/2);//第一个点中心
        CGContextMoveToPoint(ctx, point.x, point.y);
        for (int i = 1;i<self.password.count ; i++) {
            NSString *next = self.password[i];
            int nextNum = next.intValue;
            IMRect *nextRe =  self.array[nextNum -1];
            
            CGPoint nextPoint = CGPointMake(nextRe.rect.origin.x+nextRe.rect.size.width/2, nextRe.rect.origin.y+nextRe.rect.size.height/2);
            CGContextAddLineToPoint(ctx, nextPoint.x, nextPoint.y);
            
        }
        CGContextAddLineToPoint(ctx,self.point.x ,self.point.y);
        CGContextStrokePath(ctx);
        if (self.password.count) {
            CGContextSetLineWidth(ctx, 1);
            CGContextSetFillColorWithColor(ctx, FillColor.CGColor);
            for (NSString *numStr in self.password) {
                IMRect *r = self.array[numStr.intValue - 1];
                CGRect center = CGRectMake(r.rect.origin.x+ PointW/4, r.rect.origin.y+PointW/4, PointW/2, PointW/2);
                CGContextFillEllipseInRect(ctx, center);
                CGContextStrokeEllipseInRect(ctx, r.rect);
            }
        }
        
        
    }
    
    
    
    
    
    
}
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    for (UITouch *touch in touches) {
//        CGPoint point = [touch locationInView:self];
//        NSLog(@"%f-----%f",point.x
//              ,point.y);
//    }
//}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    //如果不存在手势密码
    if (!self.passWordString) {
        
        if (self.password.count<5) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"至少要5个点" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
            [self.password removeAllObjects];
            [self setNeedsDisplay];
            
            return;
        }
        self.passWordString = [self.password description];
        [self.password removeAllObjects];
        [self setNeedsDisplay];
        self.tilte.text = @"请再次绘制图案";
    }else
    //如果存在
    {
        NSString *typeIn = [self.password description];
        //再次输入相同
        if ([typeIn isEqualToString:self.passWordString]) {
            [AccountUtil savePicPwString:self.passWordString];
            if (self.passBlock) {
                self.passBlock();
            }
            
            
            [self removeSelfFromBottom];
            
            
        }else{
            if ([self.tilte.text isEqualToString:@"请再次绘制图案"]) {
                self.passWordString = nil;
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"两次绘制的图案不同,请重新设置" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }
            [self.password removeAllObjects];
            [self setNeedsDisplay];
            
        }
        
    }
    
    
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self];
//        NSLog(@"%f-----%f",point.x
//              ,point.y);
        self.point = point;
        //判断触电是否经过某个连接点
        for (IMRect *rect in self.array) {
            if ([self point:point isInside:rect.rect]){
                //检查该点是否已经被选中，如果没有则添加进密码序列
                NSString *str = [NSString stringWithFormat:@"%ld",(long)rect.number];
                
                if (![self.password containsObject:str]) {
                    [self.password addObject:str];
                  
                }
            }
        }
       [self setNeedsDisplay];
    }
    
}

- (BOOL)point:(CGPoint) point isInside:(CGRect) rect{
    
    if ((point.x>= rect.origin.x)&&(point.x<= rect.origin.x+PointW)&&(point.y>= rect.origin.y)&&(point.y<= rect.origin.y+PointW)) {
        return YES;
    }
    return NO;
}

- (void)setPassWordString:(NSString *)passWordString {
    _passWordString = passWordString;
    if (!passWordString) {
        self.tilte.text = @"设置解锁手势";
    }else{
        self.tilte.text = @"请绘制解锁图案";
    }
}
@end
