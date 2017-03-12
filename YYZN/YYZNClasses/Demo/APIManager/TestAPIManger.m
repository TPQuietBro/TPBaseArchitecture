//
//  TestAPIManger.m
//  YYZN
//
//  Created by ccpg_it on 17/2/27.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "TestAPIManger.h"
#import "EWParamsSplitJoint.h"
#import "EWNetworking.h"

@interface TestAPIManger()

@property (nonatomic , strong) NSMutableURLRequest *request;

@end

@implementation TestAPIManger


- (instancetype)initWithCustomRequest:(NSMutableURLRequest *)customRequest
{
    self = [super init];
    if (self) {
        self.request = customRequest;
    }
    return self;
}

- (EWRequestType)requestType{
    return EWAPIRequestTypeGet;
}

- (NSString *)requestMethod{
    return @"video";
}

- (NSDictionary *)params{
    return @{@"type":@"JSON"};
}

- (NSNumber *)shouldCache{
    return @180;
}

- (NSString *)memberCode{
    return @"";
}

- (NSDictionary *)animationTargetAction{
    return @{
             EWRequestAnimationTarget : @"ZNRequestAnimation",
             EWShowHudAnimation : @"showHudAnimation",
             EWHideHudAtWindow : @"hideHudAtWindow"
             };
}

- (NSDictionary *)headerDict{
    return nil;
}


- (NSDictionary *)paramsForAPI{
    //拼接请求的字典参数
    NSDictionary *paramsS = [EWParamsSplitJoint splitJointPublicParamsWithMethodName:[self requestMethod] andParams:[self params] memberCode:[self memberCode] paramsType:EWPublicParamsTypeProperty];
    //整理成请求需要的字典格式
    return [NSDictionary getParamsDictWithURL:paramsS[EWRequestURLKey] paramsDict:paramsS[EWRequestDictKey] cacheTime:[self shouldCache] headerDict:nil];
}

@end
