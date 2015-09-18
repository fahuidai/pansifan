//
//  FABidCellView.m
//  Fahuidai
//
//  Created by mortal on 15/9/18.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FABidCellView.h"

@implementation FABidCellView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews {

    self.frame = CGRectMake(0, 0, ScreenSize.width-5,100 );
    
    self.backgroundColor = [UIColor grayColor];
}
@end
