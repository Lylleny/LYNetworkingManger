//
//  NSArray+LYNetworking.m
//  LYNetworkingManger
//
//  Created by wangshubing on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "NSArray+LYNetworking.h"

@implementation NSArray (LYNetworking)
-(NSString *)ArrayToParamsString{
    NSMutableString *string = [[NSMutableString alloc]init];
    NSArray *arr = [self sortedArrayUsingSelector:@selector(compare:)];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (string.length == 0) {
            [string appendFormat:@"%@",obj];
        }else{
            [string appendFormat:@"&%@",obj ];
        }
    }];
    return string;
}
@end
