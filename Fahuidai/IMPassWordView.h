//
//  IMPassWordView.h
//  Fahuidai
//
//  Created by mortal on 15/9/17.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PassBlock)();
@protocol IMPassWordViewDelegate<NSObject>
@optional
//当点击忘记手势的时候调用这个代理
- (void)doForgetPw;
@end

@interface IMPassWordView : UIView
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,weak)id<IMPassWordViewDelegate> delegate;
@property (nonatomic,copy)PassBlock passBlock;
@end
