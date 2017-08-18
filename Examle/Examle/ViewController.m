//
//  ViewController.m
//  Examle
//
//  Created by 颜阿龙 on 2017/8/18.
//  Copyright © 2017年 Lylleny. All rights reserved.
//

#import "ViewController.h"
#import "LYNetworking.h"

@interface ViewController ()<LYNetworkingCallBackDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LYNetworkingAPIManger *api = [[LYNetworkingAPIManger alloc]init];
    api.delegate = self;
    api.apiMethod = @"";
    api.requestParams=@{@"key":@"6f2fe773cd7e0ba5eca2d74e554e3b0e"};
    api.requestType = LYRequestTypePOST;
    [api refreshData];
    
}

-(void)loadDataWithCallBackFailed:(LYURLResponseStatus)status manger:(LYNetworkingAPIManger *)manger{
    NSLog(@"%ld=======",status);
}

-(void)loadDataWithCallBackSuccessed:(LYURLResponse *)response manger:(LYNetworkingAPIManger *)manger{
    NSLog(@"=======reponse===========\n%@===============",response);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
