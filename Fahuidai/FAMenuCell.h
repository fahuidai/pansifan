//
//  FAMenuCell.h
//  Fahuidai
//
//  Created by mortal on 15/9/19.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    MenuCellTypeHome = 0,//首页
    MenuCellTypeBid,//发标
    MenuCellTypeUser,//用户
    MenuCellTypeMore//更多
} MenuCellType;
@interface FAMenuCell : UITableViewCell

+ (instancetype)cellWithType:(MenuCellType)type;
@end
