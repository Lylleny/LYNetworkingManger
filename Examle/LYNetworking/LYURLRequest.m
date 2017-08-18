//
//  LYURLRequest.m
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYURLRequest.h"
#import "LYNetworking.h"
#import "LYBaseParams.h"
#import "NSDictionary+LYNetworking.h"
#import "LYLogerManger.h"

@interface LYURLRequest ()
@property (nonatomic,strong) AFHTTPRequestSerializer *httpRequestSerializer;
@end
@implementation LYURLRequest

-(AFHTTPRequestSerializer *)httpRequestSerializer{
    if (!_httpRequestSerializer) {
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
        _httpRequestSerializer.timeoutInterval = LYNetworkingTimeout;
        _httpRequestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    }
    return _httpRequestSerializer;
}

+(instancetype)sharedInstance{
    static LYURLRequest*_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[LYURLRequest alloc]init];
    });
    return _sharedInstance;
}

-(NSURLRequest *)generateGetRequestWithAPIMethodName:(NSString *)apiName Params:(NSDictionary *)params error:(NSError *__autoreleasing *)error{
    NSMutableDictionary *allParams = [LYBaseParams baseParams].mutableCopy;
    [allParams addEntriesFromDictionary:params];
    NSMutableString *url = [[NSMutableString alloc]init];
    [url appendFormat:@"%@",BASE_URL ];
    if (apiName.length >0) {
        [url appendFormat:@"/%@",apiName];
    }
    [url appendFormat:@"?%@",[params dictoryToParamString]];
    
    [[LYLogerManger sharedInstance]LoggerRequestUrl:url RequestParams:[allParams dictoryToParamString]];
    
    NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"GET"
                                                                       URLString:url
                                                                      parameters:params
                                                                           error:error];
    request.timeoutInterval = LYNetworkingTimeout;
    return request;
    
}

-(NSURLRequest *)generatePostRequestWithAPIMethodName:(NSString *)apiName Params:(NSDictionary *)params error:(NSError *__autoreleasing *)error{
    NSMutableDictionary *allParams = [LYBaseParams baseParams].mutableCopy;
    [allParams addEntriesFromDictionary:params];
    NSMutableString *url = [[NSMutableString alloc]init];
    [url appendFormat:@"%@",BASE_URL ];
    if (apiName.length >0) {
        [url appendFormat:@"/%@",apiName];
    }
    
    [[LYLogerManger sharedInstance]LoggerRequestUrl:url RequestParams:[allParams dictoryToParamString]];

    NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"POST"
                                                                   URLString:url
                                                                  parameters:allParams
                                                                       error:error];
    request.timeoutInterval = LYNetworkingTimeout;
    return request;
}
@end
