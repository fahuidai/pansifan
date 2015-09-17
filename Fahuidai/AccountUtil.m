//
//  AccountUtil.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "AccountUtil.h"
#import "User.h"
@implementation AccountUtil


+ (void) saveAccount :(User *) user{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:user forKey:@"user"];
    [ud synchronize];
}

+ (User *)getAccount {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    User *user = [ud objectForKey:@"user"];
    return user;
}

+ (BOOL)checkForLogin {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    User *user = [ud objectForKey:@"user"];
    if (user) {
        return YES;
    }
    return NO;
}
@end
