//
//  LYNetworkingAPIProxy.m
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYNetworkingAPIProxy.h"
#import "LYURLRequest.h"
#import "LYURLResponse.h"
#import "AFNetworking.h"
#import "LYNetworkingAPIProxy.h"

@interface LYNetworkingAPIProxy ()
@property (nonatomic,strong) AFURLSessionManager *sessionManger;
@end

@implementation LYNetworkingAPIProxy

-(AFURLSessionManager *)sessionManger{
    if (!_sessionManger) {
        _sessionManger = [[AFURLSessionManager alloc]init];
        _sessionManger.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _sessionManger;
}


+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static LYNetworkingAPIProxy *_shareInstace;
    dispatch_once(&onceToken, ^{
        _shareInstace = [[LYNetworkingAPIProxy alloc]init];
    });
    return _shareInstace;
}

-(NSURLSessionDataTask *)contnectServiceGetWithParams:(NSDictionary *)params APIMethodName:(NSString *)methodName success:(LYCallback)success fail:(LYCallback)fail{
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [[LYURLRequest sharedInstance] generateGetRequestWithAPIMethodName:methodName Params:params error:&serializationError].mutableCopy;

    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [self.sessionManger dataTaskWithRequest:request
                          uploadProgress:nil
                        downloadProgress:nil
                       completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error){
                           if (error) {
                               LYURLResponse *Response = [[LYURLResponse alloc]initWithURLResponse:response responseObject:responseObject error:error];
                               fail?fail(Response):nil;
                           } else {
                               LYURLResponse *Response = [[LYURLResponse alloc]initWithURLResponse:response responseObject:responseObject status:LYURLResponseStatusSuccess];
                               success?success(Response):nil;
                           }
                       }];
    [dataTask resume];
    return dataTask;
}

-(NSURLSessionDataTask *)contnectServicePostWithParams:(NSDictionary *)params APIMethodName:(NSString *)methodName success:(LYCallback)success fail:(LYCallback)fail{
    NSError *error = nil;
    NSMutableURLRequest *request = [[LYURLRequest sharedInstance]generatePostRequestWithAPIMethodName:methodName Params:params error:&error].mutableCopy;
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [self.sessionManger dataTaskWithRequest:request
                                        uploadProgress:nil
                                      downloadProgress:nil
                                     completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error){
                                         if (error) {
                                             LYURLResponse *Response = [[LYURLResponse alloc]initWithURLResponse:response responseObject:responseObject error:error];
                                             fail?fail(Response):nil;
                                         } else {
                                             LYURLResponse *Response = [[LYURLResponse alloc]initWithURLResponse:response responseObject:responseObject status:LYURLResponseStatusSuccess];
                                             success?success(Response):nil;
                                         }
                                     }];
    [dataTask resume];
    return dataTask;

    
}
@end
