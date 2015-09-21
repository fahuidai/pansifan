//
//  FAImageView.m
//  Fahuidai
//
//  Created by mortal on 15/9/21.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FAImageView.h"

@implementation FAImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, BackGroundColor.CGColor);
    CGContextMoveToPoint(ctx, 0, 40);
    CGContextAddLineToPoint(ctx, rect.size.width, 40);
    CGContextStrokePath(ctx);
    
}


@end
