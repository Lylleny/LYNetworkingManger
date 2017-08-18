//
//  LYAPPSetting.h
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYAPPSetting : NSObject
@property (nonatomic,copy,readonly) NSString *appName;
@property (nonatomic,copy,readonly) NSString *appVersion;
@property (nonatomic,copy,readonly) NSString *net;
@property (nonatomic,copy,readonly) NSString *appBuild;
@property (nonatomic,copy,readonly) NSString *currentTimeSamp;
@property (nonatomic,copy,readonly) NSString *currentTime;
@property (nonatomic,assign,readonly) BOOL isReachable;
/**
 reture APP Device setting infomation
 
 */
+ (instancetype )sharedInstance;

- (NSDictionary *)APPSettingInfo;
@end
