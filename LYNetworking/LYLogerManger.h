//
//  LYLogerManger.h
//  LYNetworkingManger
//
//  Created by wangshubing on 2017/8/18.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYURLResponse.h"

@interface LYLogerManger : NSObject
+(instancetype)sharedInstance;
- (void)LoggerRequestUrl:(NSString *)url   RequestParams:(NSString *)params;
- (void)LoggerResponseString:(NSString *)contentString   responseUrl:(NSString *)url;
- (void)LoggerFailedResponseCode:(NSInteger)code  status:(LYURLResponseStatus )status;
@end
