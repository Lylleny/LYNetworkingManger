//
//  LYURLResponse.m
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYURLResponse.h"
#import "NSDictionary+LYNetworking.h"
#import "LYLogerManger.h"

@implementation LYURLResponse

-(instancetype)initWithURLResponse:(NSURLResponse *)response responseObject:(id)object error:(NSError *)error{
    self = [super init];
    if (self) {
        self.urlString = [response.URL absoluteString];
        self.responseObject = object;
        self.status = [self handleResponseStatus:error];
        [[LYLogerManger sharedInstance]LoggerFailedResponseCode:error.code status:self.status];
    }
    return self;
}


-(instancetype)initWithURLResponse:(NSURLResponse *)response responseObject:(id)responseObject status:(LYURLResponseStatus)status{
    self = [super init];
    if (self) {
        self.urlString = [response.URL absoluteString];
        self.responseObject = responseObject;
        self.status = status;
        if (responseObject) {
            self.body = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:NULL];
            self.responseString = [self.body jsonString];
            [[LYLogerManger sharedInstance]LoggerResponseString:self.responseString responseUrl:self.urlString];
        }else{
            self.body = nil;
        }
        
    }
    return self;
}

- (LYURLResponseStatus )handleResponseStatus:(NSError *)error{
    if (error) {
        if (error.code == NSURLErrorTimedOut) {
            return LYURLResponseStatusTimeout;
        }
        return LYURLResponseStatusFail;
    }
    
    return LYURLResponseStatusSuccess;

}
@end
