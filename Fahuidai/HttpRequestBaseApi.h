//
//  HttpRequestBaseApi.h
//  Fahuidai
//
//  Created by 金晨 on 15/9/29.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMMapper.h"
#import "HttpRequestDelegate.h"

typedef void(^Success)(NSArray *dataArr);
typedef void(^Failure)(NSString *errorMessage);

@interface HttpRequestBaseApi : NSObject
{
@protected
    __weak id<HttpRequestDelegate> httpDelegate;
}
@end
