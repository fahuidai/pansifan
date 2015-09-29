//
//  HttpRequestBaseApi.m
//  Fahuidai
//
//  Created by 金晨 on 15/9/29.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "HttpRequestBaseApi.h"
#import "AFNetworking.h"

static NSString *requestApi = hostAPI;

@interface HttpRequestBaseApi ()<HttpRequestDelegate>
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failureBlock;
@end

@implementation HttpRequestBaseApi

-(instancetype)init{
    self = [super init];
    if (self) {
        httpDelegate = self;
        [self reach];
    }
    return self;
}


-(void)reach
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                debugLog(@"网络连接异常!");
                break;
                
            default:
                break;
        }
    }];
}

#pragma mark - HttpRequestDelegate

-(void)postRequest:(NSString *)actionName
          postData:(NSDictionary *)postData
           Success:(SuccessBlock)success
           Failure:(FailureBlock)failure
{
    NSString *targetPostAddress =[NSString stringWithFormat:@"%@%@",requestApi,actionName];
    
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    self.successBlock = [success copy];
    self.failureBlock = [failure copy];
    
    success = nil;
    failure = nil;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:targetPostAddress]];
    [request setTimeoutInterval:25];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *mData = [[NSMutableData alloc]init];
    NSMutableArray *mDataArr = [[NSMutableArray alloc]init];
    for (NSString *key in postData) {
        NSString *value = postData[key];
        NSMutableDictionary *keyValuePair = [NSMutableDictionary dictionaryWithCapacity:2];
        [keyValuePair setValue:key forKey:@"key"];
        [keyValuePair setValue:[value description] forKey:@"value"];
        [mDataArr addObject:keyValuePair];
        
        NSData *data = [[NSString stringWithFormat:@"%@=%@&",key,value] dataUsingEncoding:NSUTF8StringEncoding];
        [mData appendData:data];
    }
    
    NSMutableData *mPostBody = [[NSMutableData alloc]init];
    NSUInteger i =0;
    NSUInteger count = [mDataArr count]-1;
    for (NSDictionary *val in mDataArr) {
        NSString *data = [NSString stringWithFormat:@"%@=%@%@", [self encodeURL:[val objectForKey:@"key"]], [self encodeURL:[val objectForKey:@"value"]],(i<count ?  @"&" : @"")];
        
        [mPostBody appendData:[data dataUsingEncoding:NSUTF8StringEncoding]];
        i++;
    }
    [request addValue:[NSString stringWithFormat:@"%llu",(long long)[mPostBody length]] forHTTPHeaderField:@"Content-Length"];
    
    [request setHTTPBody:mPostBody];
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        if ([httpDelegate respondsToSelector:@selector(success:)]) {
            [httpDelegate success:responseObject];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if ([httpDelegate respondsToSelector:@selector(failure:)]) {
            [httpDelegate failure:error];
        }
        
    }];
    [operation start];
}

-(void)success:(NSData *)responseData
{
    if (self.successBlock) {
        self.successBlock(responseData);
    }
}

-(void)failure:(NSError *)failureError
{
    if (self.failureBlock) {
        self.failureBlock(failureError);
    }
}

- (NSString*)encodeURL:(NSString *)string
{
    NSString *newString = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
    if (newString) {
        return newString;
        
    }
    return @"";
}

#pragma mark - get

-(AFHTTPRequestOperationManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPRequestOperationManager manager];
    }
    return _manager;
}
@end
