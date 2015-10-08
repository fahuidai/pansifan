//
//  FAMenuCell.m
//  Fahuidai
//
//  Created by mortal on 15/9/19.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import "FAMenuCell.h"

@implementation FAMenuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}
+ (instancetype)cellWithType:(MenuCellType)type{
    
    FAMenuCell *cell = [[FAMenuCell alloc]init];
    cell.backgroundColor = [UIColor clearColor];
    
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    NSString *title;
    UIImage *image;
    switch (type) {
        case MenuCellTypeHome:
            title = @"我要投资";
            image = [UIImage imageNamed:@"leftinvest"];
            break;
        case MenuCellTypeBid:
            title = @"我要借款";
            image = [UIImage imageNamed:@"leftbrrow"];
            break;
        case MenuCellTypeUser:
            title = @"我的账户";
            image = [UIImage imageNamed:@"leftaccount"];
            
            break;
        case MenuCellTypeMore:
            title = @"更       多";
            image = [UIImage imageNamed:@"leftmore"];
            break;
        case MenuCellTypeLawer:
            title = @"我是律师";
            image = [UIImage imageNamed:@"leftmore"];
            break;
        default:
            break;
    }
    cell.textLabel.text = title;
    if (isIphone6) {
        [cell.textLabel setFont:[UIFont systemFontOfSize:20]];
    }
    //
    cell.imageView.image= image;
    return cell;
}

@end
