//
//  FABidCellView.h
//  Fahuidai
//
//  Created by mortal on 15/9/18.
//  Copyright © 2015年 fahuidai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FABidModel.h"
@interface FABidCellView : UIView

@property (strong,nonatomic) FABidModel *bid;
@property (weak,nonatomic) UILabel *moneyLabel;
@property (weak,nonatomic) UILabel *endTimeLabel;
@property (weak,nonatomic) UILabel *percentLabel;
@end
