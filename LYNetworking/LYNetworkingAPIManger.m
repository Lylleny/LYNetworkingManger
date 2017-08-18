//
//  LYNetworkingAPIManger.m
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYNetworkingAPIManger.h"
#import "LYNetworkingAPIProxy.h"
#import "LYAPPSetting.h"
#import "LYNetworking.h"
#import "LYURLResponse.h"
#import "AFNetworking.h"

@interface LYNetworkingAPIManger ()

@end

@implementation LYNetworkingAPIManger

-(BOOL)isReachable{
    BOOL isReachable = [LYAPPSetting sharedInstance].isReachable;
    if (!isReachable) {
        self.errorType = LYURLResponseStatusNoNetwork;
    }
    return isReachable;
}

-(instancetype)init{
    self = [super init];
    if (self) {
     
    }
    return self;
}

- (void)refreshData{
    [self loadDataWithParams:self.requestParams];
}

- (void)loadDataWithParams:(NSDictionary *)params{
    if (self.isReachable) {
        if (self.requestType == LYRequestTypeGET) {
            AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
            manger.requestSerializer = [AFHTTPRequestSerializer serializer];
            manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//            [manger GET:@"http://v.juhe.cn/WNXG/city?key=6f2fe773cd7e0ba5eca2d74e554e3b0e" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//                
//            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                NSLog(@"%@",responseObject);
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                NSLog(@"%@",error);
//
//            }];
            [[LYNetworkingAPIProxy shareInstance] contnectServiceGetWithParams:params APIMethodName:self.apiMethod success:^(LYURLResponse *response) {
                [self handleWithSuccessedResponse:response];
            } fail:^(LYURLResponse *response) {
                [self handleWithFailedResponse:response.status];
            }];
        }
        
        if (self.requestType == LYRequestTypePOST) {
            [[LYNetworkingAPIProxy shareInstance]contnectServicePostWithParams:params APIMethodName:self.apiMethod success:^(LYURLResponse *response) {
                [self handleWithSuccessedResponse:response];
            } fail:^(LYURLResponse *response) {
                [self handleWithFailedResponse:response.status];
            }];
        }
    }else{
        [self handleWithFailedResponse:LYURLResponseStatusNoNetwork];
    }
}


- (void)handleWithSuccessedResponse:(LYURLResponse *)response{
    if ([self.delegate respondsToSelector:@selector(loadDataWithCallBackSuccessed:manger:)]) {
        [self.delegate loadDataWithCallBackSuccessed:response manger:self];
    }
}

- (void)handleWithFailedResponse:(LYURLResponseStatus )status{
    if ([self.delegate respondsToSelector:@selector(loadDataWithCallBackFailed:manger:)]) {
        [self.delegate loadDataWithCallBackFailed:status manger:self];
    }
}
@end
