//
//  UIView+Animation.m
//  Fahuidai
//
//  Created by mortal on 15/9/15.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void)addSubviewFromBottom:(UIView *) view{
    CGPoint origin = view.frame.origin;
    CGSize size = view.frame.size;
    
    view.frame = CGRectMake(0, ScreenSize.height, size.width, size.height);
    [self addSubview:view];
    
    [UIView animateWithDuration:0.2 animations:^{
        view.frame = CGRectMake(origin.x, origin.y, size.width, size.height);
    }];
    
}

- (void)removeSelfFromBottom{
    CGSize size = self.frame.size;

    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(0, ScreenSize.height, size.width, size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)moveInY:(CGFloat)y {
    
    CGRect rect = self.frame;
    CGRect newRect = CGRectMake(rect.origin.x, rect.origin.y-y, rect.size.width, rect.size.height);
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = newRect;
    }];
}
@end
