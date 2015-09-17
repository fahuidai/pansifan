//
//  IMPassWordView.h
//  Fahuidai
//
//  Created by mortal on 15/9/17.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol IMPassWordViewDelegater<NSObject>
@optional

- (void)doForgetPw;
@end

@interface IMPassWordView : UIView
@property (nonatomic,strong) NSMutableArray *array;
@end
