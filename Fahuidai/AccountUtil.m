//
//  AccountUtil.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "AccountUtil.h"

@implementation AccountUtil


+ (void) saveAccount :(NSString *) user{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:user forKey:@"user"];
    [ud synchronize];
}

+ (NSString *)getAccount {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *user = [ud objectForKey:@"user"];
    return user;
}

+ (BOOL)checkForLogin {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *user = [ud objectForKey:@"user"];
    if (user) {
        return YES;
    }
    return NO;
}

+ (NSString *)getPicPwString {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *string = [ud objectForKey:@"picPwString"];
    return string;
    
}
+ (void)savePicPwString:(NSString *)string {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:string forKey:@"picPwString"];
    [ud synchronize];
}
+ (BOOL)checkForPicPw {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *string = [ud objectForKey:@"picPwString"];
    if (string) {
        return YES;
    }
    return NO;
}
@end
