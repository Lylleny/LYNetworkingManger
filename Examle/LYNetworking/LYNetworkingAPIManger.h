//
//  LYNetworkingAPIManger.h
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/16.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYURLResponse.h"

@class LYNetworkingAPIManger;

typedef NS_ENUM(NSInteger,LYRequestType) {
     LYRequestTypePOST,
     LYRequestTypeGET
};

@protocol LYNetworkingCallBackDelegate <NSObject>

- (void)loadDataWithCallBackSuccessed:(LYURLResponse *)response   manger:(LYNetworkingAPIManger *)manger;
- (void)loadDataWithCallBackFailed:(LYURLResponseStatus )status     manger:(LYNetworkingAPIManger *)manger;

@end

@interface LYNetworkingAPIManger : NSObject
@property (nonatomic,weak) id <LYNetworkingCallBackDelegate> delegate;

@property (nonatomic) BOOL  isReachable;
@property (nonatomic,assign) LYURLResponseStatus errorType;
@property (nonatomic,copy) NSString *apiMethod;
@property (nonatomic,strong) NSDictionary *requestParams;
@property (nonatomic,assign) LYRequestType requestType;

- (void)refreshData;

@end
