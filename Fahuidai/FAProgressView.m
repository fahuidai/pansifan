//
//  FAProgressView.m
//  Fahuidai
//
//  Created by mortal on 15/9/21.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FAProgressView.h"

@implementation FAProgressView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UILabel *perLabel  = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 60,30)];
        [perLabel setFont:[UIFont systemFontOfSize:14]];
        //perLabel.center = self.center;
        
        self.perLabel = perLabel;
        [self addSubview:perLabel];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    
    
    CGContextSetFillColorWithColor(ctx, BackGroundColor.CGColor);
    CGRect round1 = CGRectMake(2,2, rect.size.width-4, rect.size.height-4);
    CGContextFillEllipseInRect(ctx, round1);
    
    CGRect round2 = CGRectMake(12, 12, rect.size.width-24, rect.size.height- 24);
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextFillEllipseInRect(ctx, round2);
    
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(ctx, BaseColor.CGColor);
    CGContextSetLineWidth(ctx, 10);
    
    
    if (self.percent) {
        CGContextAddArc(ctx, rect.size.width/2,rect.size.height/2,28, -M_PI_2,self.percent/100*2*M_PI - M_PI_2, 0);
        CGContextStrokePath(ctx);
    }
  
}
- (void)setPercent:(CGFloat)percent{
    _percent = percent;
    
    
    
    self.perLabel.text = [NSString stringWithFormat:@"%ld%@",(long)[[NSNumber numberWithFloat:percent] integerValue],@"%"];
    [self setNeedsDisplay];
}

@end
