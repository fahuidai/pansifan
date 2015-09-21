//
//  FABidCell.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "FABidCell.h"
#import "FABidModel.h"
#import "FABidCellView.h"
@implementation FABidCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithBid:(FABidModel *)bid for:(UITableView *)tableView{
    static NSString *bidCell = @"bidCell";
    
    FABidCell *cell = [tableView dequeueReusableCellWithIdentifier:bidCell];
    if (!cell) {
        cell = [[FABidCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bidCell];
        [cell.contentView addSubview:[[FABidCellView alloc]init]];
        
    }
    
    return cell;
}
@end
