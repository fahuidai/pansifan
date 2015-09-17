//
//  FAMenuVC.h
//  Fahuidai
//
//  Created by mortal on 15/9/15.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FAMenuVCDelegate <NSObject>
@optional
- (void)didSelectItem:(NSString *)title;

@end
@interface FAMenuVC : UIViewController

@property (weak,nonatomic) id<FAMenuVCDelegate> delegate;

@end
