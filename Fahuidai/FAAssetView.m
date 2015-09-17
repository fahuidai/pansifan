//
//  FAAssetView.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FAAssetView.h"

@implementation FAAssetView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [@"资产总额" drawInRect:CGRectMake(0, 0, 60, 30) withAttributes:nil];
    CGContextMoveToPoint(ctx, 0, rect.size.height/2);
    CGContextAddLineToPoint(ctx, rect.size.width, rect.size.height/2);
    
    CGContextStrokePath(ctx);
}


@end
