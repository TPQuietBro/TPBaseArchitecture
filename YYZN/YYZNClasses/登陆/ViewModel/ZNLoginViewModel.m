//
//  ZNLoginViewModel.m
//  YYZN
//
//  Created by CCPG_iOS on 2017/3/1.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ZNLoginViewModel.h"
#import "ZNLoginAPIManager.h"
#import "CSSHomeView.h"

@interface ZNLoginViewModel()<EWAPICallBackProtocol>

@property (strong,nonatomic) ZNLoginAPIManager *loginManager;

@property (nonatomic , strong) CSSHomeView *homeView;

@end

@implementation ZNLoginViewModel

- (instancetype)initWithView:(CSSHomeView *)homeView
{
    self = [super init];
    if (self) {
        self.homeView = homeView;
    }
    return self;
}


- (void)start{
   
    
    //接收外部传入的参数
    self.loginManager.outerParams = (NSMutableDictionary *)@{
                                      @"user":self.homeView.name,
                                      @"password":self.homeView.password,
                                      @"memberCode":self.homeView.memerCode
                                      };
    
    SLog(@"--%@",self.loginManager.outerParams);

    [self.loginManager loadData];
}

/**
 * 刷新界面
 */
- (void)refreshDataInView:(UIView *)view withData:(id)data{
    
}

//请求成功
- (void)managerCallBackDidSuccess:(EWAPIBaseManager *)manager{
    NSLog(@"%@",manager.response.responseObject);
    if ([manager.response.responseObject[@"Result"] intValue] == 1) {
        if ([self.delegate respondsToSelector:@selector(pushViewControllerWithParam:)]) {
            [self.delegate pushViewControllerWithParam:nil ];
        }
        
    }
}

//请求失败
- (void)managerCallBackDidFailed:(EWAPIBaseManager *)manager{
    NSLog(@"%@",manager);
}

- (ZNLoginAPIManager *)loginManager{
    if (!_loginManager) {
        _loginManager = [[ZNLoginAPIManager alloc]init];
         //设置请求的代理
        _loginManager.delegate = self;
    }
    
    return _loginManager;
}

@end
