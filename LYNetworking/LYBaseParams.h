//
//  LYBaseParams.h
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYBaseParams : NSObject

/**
 return api base params,such as platform,version,language,app_version

 @return base params
 */
+(NSDictionary *)baseParams;

@end
