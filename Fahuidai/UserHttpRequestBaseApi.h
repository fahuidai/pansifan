//
//  UserHttpRequestBaseApi.h
//  Fahuidai
//
//  Created by 金晨 on 15/9/29.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "HttpRequestBaseApi.h"
#import "User.h"

typedef void(^UserBlock)(User *user);
typedef void(^Failure)(NSString *errorMessage);

@interface UserHttpRequestBaseApi : HttpRequestBaseApi

-(void)userRegister:(NSString *)username
           password:(NSString *)password
            success:(UserBlock)successBlock
            failure:(Failure)failureBlock;
@end
