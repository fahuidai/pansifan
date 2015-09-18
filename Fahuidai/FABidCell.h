//
//  FABidCell.h
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FABidModel;
@interface FABidCell : UITableViewCell

+ (instancetype)cellWithBid:(FABidModel *)bid for:(UITableView *)tableView;
@end
