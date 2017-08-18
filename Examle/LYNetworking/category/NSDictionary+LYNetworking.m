//
//  NSDictionary+LYNetworking.m
//  LYNetworkingManger
//
//  Created by wangshubing on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "NSDictionary+LYNetworking.h"
#import "NSArray+LYNetworking.h"

@implementation NSDictionary (LYNetworking)
-(NSString *)jsonString{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

-(NSString *)base64Encode{
    NSString *json = [self jsonString];
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    return base64String;
}

-(NSString *)dictoryToParamString{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:[NSString class]]) {
            obj = [NSString stringWithFormat:@"%@",obj];
            obj = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)obj,  NULL,  (CFStringRef)@"!*'();:@&;=+$,/?%#[]",  kCFStringEncodingUTF8));

        }
        
        if ([obj length]>0) {
            [array addObject:[NSString stringWithFormat:@"%@=%@",key,obj]];
        }
    }];
    NSArray *sortArr = [array sortedArrayUsingSelector:@selector(compare:)];
    return [sortArr ArrayToParamsString];
}
@end
