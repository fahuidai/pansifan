//
//  FABidCellView.m
//  Fahuidai
//
//  Created by mortal on 15/9/18.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FABidCellView.h"
#import "FAIcon.h"
#import "FAImageView.h"
#import "FAProgressView.h"
#define MoneyColor [UIColor colorWithRed:209/255.f green:47/255.f blue:27/255.f alpha:1]
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

    self.frame = CGRectMake(5, 0, ScreenSize.width- 10,120 );
    self.backgroundColor = [UIColor lightGrayColor];
    FAImageView *bg = [[FAImageView alloc]initWithFrame:self.bounds];
    bg.image = [UIImage imageNamed:@"圆角矩形-1"];
    [self addSubview:bg];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 40, self.frame.size.width, 1)];
    line.backgroundColor = BackGroundColor;
    [self addSubview:line];
    FAIcon *icon1 = [FAIcon iconWithName:@"荐"];
    icon1.frame = CGRectMake(5, 5, 30, 30);
    [self addSubview:icon1];
    
    FAIcon *icon2 = [FAIcon iconWithName:@"保"];
    icon2.frame = CGRectMake(40, 5, 30, 30);
    
    [self addSubview:icon2];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(75, 0, self.frame.size.width -80, 40)];
    [label setFont:[UIFont systemFontOfSize:18]];
    [self addSubview:label];
    label.text = @"测试测试测试测试测试测试卷发；说的就是；fjsdffa";
    
    UILabel *b = [[UILabel alloc]initWithFrame:CGRectMake(5, 45,65, 30)];
    [b setFont:[UIFont systemFontOfSize:14]];
    b.text = @"借款金额:";
    [self addSubview:b];
    
    UILabel *money = [[UILabel alloc]initWithFrame:CGRectMake(65, 40, 95, 40)];
    [money setTextColor:MoneyColor];
    money.text = @"￥50万元";
    self.moneyLabel = money;
    [self addSubview:money];
    
    UILabel *e = [[UILabel alloc]initWithFrame:CGRectMake(155, 45, 40, 30)];
    [e setFont:[UIFont systemFontOfSize:14]];
    e.text = @"期限:";
    [self addSubview:e];
    
    UILabel *endTime = [[UILabel alloc]initWithFrame:CGRectMake(190, 40, 60, 40)];
    [endTime setTextColor:MoneyColor];
    endTime.text =@"三个月";
    self.endTimeLabel = endTime;
    [self addSubview:endTime];
    
    UILabel *per = [[UILabel alloc]initWithFrame:CGRectMake(5, 80, 50, 30)];
    [per setFont:[UIFont systemFontOfSize:14]];
    per.text = @"年利率:";
    [self addSubview:per];
    
    UILabel *percent = [[UILabel alloc]initWithFrame:CGRectMake(58, 75, 80, 40)];
    [percent setTextColor:MoneyColor];
    percent.text = @"18.00%";
    self.percentLabel = percent;
    [self addSubview:percent];
    
    UILabel *c = [[UILabel alloc]initWithFrame:CGRectMake(125, 80, 65, 30)];
    [c setFont:[UIFont systemFontOfSize:14]];
    c.text = @"信用等级:";
    [self addSubview:c];
    
    FAProgressView *progress = [[FAProgressView alloc]initWithFrame:CGRectMake(self.frame.size.width- 72,45,70,70)];
    [self addSubview:progress];
    progress.percent = 50.6;//百分比 CGFloat
    [progress setNeedsDisplay];
}


@end
