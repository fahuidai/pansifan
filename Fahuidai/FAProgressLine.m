//
//  FAProgressLine.m
//  Fahuidai
//
//  Created by mortal on 15/10/6.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FAProgressLine.h"
@interface FAProgressLine()
@property (assign,nonatomic)CGFloat curProgress;
@property (strong,nonatomic)NSTimer *timer;
@end
@implementation FAProgressLine


- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = BackGroundColor;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       self.backgroundColor = [UIColor clearColor];
//        self.layer.cornerRadius = 5;
        self.curProgress = 0.01;
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 5, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextAddLineToPoint(ctx, rect.size.width-5, 5);
    CGContextStrokePath(ctx);
    CGContextMoveToPoint(ctx, 5.5, 5);
    CGContextSetLineWidth(ctx, 8);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextAddLineToPoint(ctx, rect.size.width-5.5, 5);
    CGContextStrokePath(ctx);
    
    //进度条橙色线
    CGFloat width = (rect.size.width- 6)*self.curProgress;
    if (isIphone4) {
        width = (rect.size.width- 8)*self.curProgress;
    }
    
    CGContextSetLineWidth(ctx, 6);
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(ctx, 6, 5);
    CGContextAddLineToPoint(ctx, width, 5);
    CGContextStrokePath(ctx);
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(progressAnimation) userInfo:nil repeats:YES];
    
}
- (void)progressAnimation{
  
    if (self.curProgress >= self.progress) {
        [self.timer invalidate];
    }else{
        self.curProgress +=0.01;
        [self setNeedsDisplay];
    }
    
}
@end
