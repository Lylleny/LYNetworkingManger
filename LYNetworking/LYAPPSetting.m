//
//  LYAPPSetting.m
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYAPPSetting.h"
#import "AFNetworking.h"



@interface LYAPPSetting()
@property (nonatomic,copy,readwrite) NSString *net;

@end


@implementation LYAPPSetting

+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static LYAPPSetting *_sharedInstance;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[LYAPPSetting alloc]init];
    });
    return _sharedInstance;
}

-(NSString *)mainBundleInfoDictory:(NSString *)key{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:key];
}

-(NSString *)currentTimeSamp{
    return [NSString stringWithFormat:@"%0.0f",[[NSDate date] timeIntervalSince1970]];
}

-(NSString *)currentTime{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat =@"yyyy-MM-dd hh-mm-ss";
    NSString *datestring = [formatter stringFromDate:now];
    return datestring;
}

-(NSString *)appName{
    return [self mainBundleInfoDictory:@"CFBundleDisplayName"];
}

-(NSString *)appBuild{
    return [self mainBundleInfoDictory:@"CFBundleVersion"];
}

-(NSString *)appVersion{
    return [self mainBundleInfoDictory:@"CFBundleShortVersionString"];
}

-(NSString *)net{
    if (_net == nil) {
        if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
            _net = @"离线";
        }
        
        if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
            _net = @"未知";
        }
        if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus==AFNetworkReachabilityStatusReachableViaWWAN) {
            _net = @"2G/3G";
        }
        
        if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi) {
            _net = @"WiFi";
        }
    }
    return _net;
}

-(BOOL)isReachable{
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus ==AFNetworkReachabilityStatusUnknown) {
        return YES;
    }else{
        return [[AFNetworkReachabilityManager sharedManager] isReachable];
    }
}


-(NSDictionary *)APPSettingInfo{
    return @{@"networking":self.net,
             @"appVersion":self.appVersion,
             @"appBuild":self.appBuild,
             @"appName":self.appName};
}
@end
