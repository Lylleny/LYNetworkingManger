//
//  LYNetworkingAPIProxy.h
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LYURLResponse;

typedef void(^LYCallback)(LYURLResponse *response);
@interface LYNetworkingAPIProxy : NSObject

+ (instancetype)shareInstance;

- (NSURLSessionDataTask *)contnectServicePostWithParams:(NSDictionary *)params
                       APIMethodName:(NSString *)methodName
                             success:(LYCallback)success
                                fail:(LYCallback)fail;

- (NSURLSessionDataTask *)contnectServiceGetWithParams:(NSDictionary *)params
                       APIMethodName:(NSString *)methodName
                             success:(LYCallback)success
                                fail:(LYCallback)fail;
@end
