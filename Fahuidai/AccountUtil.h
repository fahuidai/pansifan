//
//  AccountUtil.h
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface AccountUtil : NSObject
//存储账号信息
+ (void) saveAccount:(User *) user;

//获得用户信息
+ (User *) getAccount;

//检查是否登陆
+ (BOOL) checkForLogin;
@end
