//
//  LYBaseParams.m
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYBaseParams.h"
#import "LYAPPSetting.h"

@implementation LYBaseParams

+(NSDictionary *)baseParams{
    NSMutableDictionary *baseParams = [[NSMutableDictionary alloc]init];
    
//    
//    [baseParams setValue:[LYAPPSetting sharedInstance].appBuild    forKey:@"build"];
//    [baseParams setValue:[LYAPPSetting sharedInstance].appName      forKey:@"appName"];
//    [baseParams setValue:[LYAPPSetting sharedInstance].appVersion   forKey:@"appVersion"];
//    [baseParams setValue:@"" forKey:@""];
//    [baseParams setValue:@"" forKey:@""];

    return baseParams;
}
@end
