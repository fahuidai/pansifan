//
//  AccountUtil.h
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountUtil : NSObject
//存储账号信息
+ (void) saveAccount:(NSString *) user;

//获得用户信息
+ (NSString *) getAccount;

//检查是否登陆
+ (BOOL) checkForLogin;
//获得存储的手势密码
+ (NSString *)getPicPwString;
//存储手势密码
+ (void)savePicPwString:(NSString *)string;
//检查是否有手势密码
+ (BOOL)checkForPicPw;
@end
