//
//  HttpRequestDelegate.h
//  Fahuidai
//
//  Created by 金晨 on 15/9/29.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 底层成功回调
 */
typedef void(^SuccessBlock)(NSData *data);
/** 底层失败回调
 */
typedef void(^FailureBlock)(NSError *error);

#define hostAPI @"http://www.xxx.com"
#define testAPI @"http://www.xxx.com"

@protocol HttpRequestDelegate <NSObject>

-(void)postRequest:(NSString *)actionName
          postData:(NSDictionary *)postData
           Success:(SuccessBlock)success
           Failure:(FailureBlock)failure;


-(void)success:(NSData *)responseData;
-(void)failure:(NSError *)failureError;

@optional
-(void)uploadRequest:(NSString *)actionName
            postData:(NSData *)postData
             success:(SuccessBlock)success
             failure:(FailureBlock)failure;
@end
