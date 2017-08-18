//
//  LYLogerManger.m
//  LYNetworkingManger
//
//  Created by wangshubing on 2017/8/18.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYLogerManger.h"

@implementation LYLogerManger
+(instancetype)sharedInstance{
    static LYLogerManger*_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[LYLogerManger alloc]init];
    });
    return _sharedInstance;
}

-(void)LoggerRequestUrl:(NSString *)url RequestParams:(NSString *)params{
        NSLog(@"\n=================================================================\nRequest url is\n====================================\n%@\n====================================\nRequest params is\n====================================\n%@\n=================================================================",url,params);
;
}

-(void)LoggerFailedResponseCode:(NSInteger)code status:(LYURLResponseStatus)status{

                NSLog(@"\n=================================================================\nFailed reponse code is\n====================================\n%ld\n====================================\nFailed reponse status\n====================================\n%ld\n=================================================================",code,status);

}

-(void)LoggerResponseString:(NSString *)contentString responseUrl:(NSString *)url{

                    NSLog(@"\n=================================================================\nResponse URL\n====================================\n%@\n====================================\nResponse json is\n====================================\n%@\n=================================================================",url,contentString);

}
@end
