//
//  FATextField.m
//  Fahuidai
//
//  Created by mortal on 15/9/20.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FATextField.h"

@implementation FATextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    
    return CGRectInset(CGRectMake(0, 0, 45, 45), 10, 10);
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, 60, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, 60, 0);
}

//- (CGRect)textRectForBounds:(CGRect)bounds{
//    return CGRectInset(bounds, 60, 0);
//}
- (void)drawTextInRect:(CGRect)rect{
    
    [super drawTextInRect:CGRectInset(self.bounds, 25, 0)];
}

@end
