//
//  FAIcon.m
//  Fahuidai
//
//  Created by mortal on 15/9/21.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FAIcon.h"

@implementation FAIcon

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)iconWithName:(NSString *)name{
    
    FAIcon *icon = [[FAIcon alloc]init];
    
    icon.backgroundColor = BaseColor;
    icon.text = name;
    [icon setTextColor:[UIColor whiteColor]];
    [icon setTextAlignment:NSTextAlignmentCenter];
    return icon;
}
@end
