//
//  LYURLResponse.h
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,LYURLResponseStatus) {
    LYURLResponseStatusSuccess,
    LYURLResponseStatusTimeout,
    LYURLResponseStatusFail,
    LYURLResponseStatusNoNetwork
};

@interface LYURLResponse : NSObject
@property (nonatomic,copy) NSString *responseString;
@property (nonatomic,copy) NSString *urlString;
@property (nonatomic,copy)    id body;
@property (nonatomic,assign) LYURLResponseStatus status;
@property (nonatomic,strong) NSData *responseObject;



-(instancetype)initWithURLResponse:(NSURLResponse *)response   responseObject:(id)responseObject  status:(LYURLResponseStatus)status;
-(instancetype)initWithURLResponse:(NSURLResponse *)response  responseObject:(id)object  error:(NSError *)error;
                                    
@end
