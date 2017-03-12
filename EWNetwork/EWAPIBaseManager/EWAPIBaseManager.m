//
//  EWAPIBaseManager.m
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWAPIBaseManager.h"
#import "EWAPIRequest.h"
#import "EWNetworkConstFile.h"
#import "EWNetworkMarcoFile.h"
/**
 * 定义完成请求的宏
 */
#define APIRequest(requestType) \
{\
EW_WeakSelf\
    [self startRequestAnimation];\
[self.apiRequest sendRequestBy##requestType##WithParams:self.childManager.paramsForAPI success:^(EWResponse *response) {\
    [weakSelf cancellReqeustAnimation];\
[weakSelf requestSuccess:response];\
} fail:^(EWResponse *response) {\
    [weakSelf cancellReqeustAnimation];\
    [weakSelf requestFailed:response];\
}];\
}

@interface EWAPIBaseManager()
//统一管理请求的请求类,用于切换网络库
@property (nonatomic , strong) EWAPIRequest *apiRequest;

@end

@implementation EWAPIBaseManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        //初始化的时候,让该类等于childManager,完成请求参数的传递
        if ([self conformsToProtocol:@protocol(EWAPIManagerProtocol)]) {
            self.childManager = (NSObject<EWAPIManagerProtocol> *)self;
        }
    }
    return self;
}
#pragma mark - public methods

/**
 * 执行请求任务
 */
- (void)loadData{
    switch (self.childManager.requestType) {
            
        case EWAPIRequestTypeGet:
            APIRequest(Get)
            break;
            
        case EWAPIRequestTypePost:
            APIRequest(Post)
            break;
            
        case EWAPIRequestTypeUploadImage:
            APIRequest(PostImage)
            break;
        default:
            break;
    }
}
/**
 * 取消请求
 */
- (void)cancelAllRequest{
    [self.apiRequest cancelRequest];
}
/**
 * 默认关闭缓存
 */
- (NSNumber *)shouldCache{
    return @0;
}

/**
 * 数据过滤,只需要传入一个过滤器即可根据过滤器的规则,进行数据过滤
 */

- (id)filterDataWithFilter:(id<EWDataFilterProtocol>)filter{
    id responseData = nil;
    
    //如果过滤器实现了过滤的代理方法,就返回过滤的数据
    if ([filter respondsToSelector:@selector(manager:filterData:)]) {
        responseData = [filter manager:self filterData:self.response.responseObject];
    }else{
        //如果没有实现,就返回原来的数据
        responseData = [self.response.responseObject mutableCopy];
    }
    return responseData;
}

#pragma mark - private methods

/**
 * 请求开始的动画
 */

- (void)startRequestAnimation{
    
    //拿到请求的动画类string
    NSString *animationTarget = self.animationTargetAction[EWRequestAnimationTarget];
    //拿到开始动画的string
    NSString *animationActionShowHud = self.animationTargetAction[EWShowHudAnimation];
    
    //反射成类
    id animationTargetClass = NSClassFromString(animationTarget);
    //反射成方法
    SEL animationActionShowHudAction = NSSelectorFromString(animationActionShowHud);
    
    //如果类存在,并且实现了动画方法
    if (animationTargetClass) {
        if ([animationTargetClass respondsToSelector:animationActionShowHudAction]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
            //写在这个中间的代码,都不会被编译器提示-Wdeprecated-declarations类型的警告
            [animationTargetClass performSelector:animationActionShowHudAction];
#pragma clang diagnostic pop
        }
    }
}

/**
 * 请求结束的动画
 */

- (void)cancellReqeustAnimation{
    
    NSString *animationTarget = self.animationTargetAction[EWRequestAnimationTarget];
    
    NSString *animationActionHideHud = self.animationTargetAction[EWHideHudAtWindow];
    
    id animationTargetClass = NSClassFromString(animationTarget);
    
    SEL animationActionHideHudAction = NSSelectorFromString(animationActionHideHud);
    
    if (animationTargetClass) {
        if ([animationTargetClass respondsToSelector:animationActionHideHudAction]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
            //写在这个中间的代码,都不会被编译器提示-Wdeprecated-declarations类型的警告
            [animationTargetClass performSelector:animationActionHideHudAction];
#pragma clang diagnostic pop
        }
    }
}

//回调成功的response,里面保存了请求成功的数据
- (void)requestSuccess:(EWResponse *)response{
    self.response = response;
    if ([self.delegate respondsToSelector:@selector(managerCallBackDidSuccess:)]) {
        [self.delegate managerCallBackDidSuccess:self];
    }
}
//回调失败的response,里面保存了请求失败的错误信息
- (void)requestFailed:(EWResponse *)response{
    self.response = response;
    if ([self.delegate respondsToSelector:@selector(managerCallBackDidFailed:)]) {
        [self.delegate managerCallBackDidFailed:self];
    }
}


#pragma mark - getter

- (EWAPIRequest *)apiRequest{
    if (!_apiRequest) {
        _apiRequest = [EWAPIRequest requestManager];
    }
    return _apiRequest;
}

@end
