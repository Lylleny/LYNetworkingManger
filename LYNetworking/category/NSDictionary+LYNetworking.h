//
//  NSDictionary+LYNetworking.h
//  LYNetworkingManger
//
//  Created by wangshubing on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (LYNetworking)
-(NSString *)base64Encode;
-(NSString *)dictoryToParamString;
-(NSString *)jsonString;
@end
