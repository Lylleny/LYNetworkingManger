//
//  LYURLRequest.h
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYURLRequest : NSObject
+ (instancetype)sharedInstance;

- (NSURLRequest *)generatePostRequestWithAPIMethodName:(NSString *)apiName
                                                Params:(NSDictionary *)params
                                                 error:(NSError *__autoreleasing *)error;
- (NSURLRequest *)generateGetRequestWithAPIMethodName:(NSString *)apiName
                                            Params:(NSDictionary *)params
                                             error:(NSError *__autoreleasing *)error;



@end
