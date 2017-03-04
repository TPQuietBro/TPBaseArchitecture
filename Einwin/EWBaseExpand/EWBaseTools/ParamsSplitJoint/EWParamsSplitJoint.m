//
//  EWParamsSplitJoint.m
//  YYZN
//
//  Created by ccpg_it on 17/2/28.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWParamsSplitJoint.h"
#import "NSDictionary+JSONToDict.h"

@implementation EWParamsSplitJoint

+ (NSDictionary *)splitJointPublicParamsWithMethodName:(NSString *)methodName andParams:(NSDictionary *)params memberCode:(NSString *)memberCode paramsType:(EWPublicParamsType)paramsType{
    
    NSDictionary *paramsDict = nil;
    switch (paramsType) {
        case EWPublicParamsTypeProperty:
            //测试接口
            paramsDict = @{
                           EWRequestURLKey : URLHostStringForTest(methodName),
                           EWRequestDictKey:params
                           };
            
//            paramsDict = @{
//                           EWURLKEY : URLHostStringForProperty(methodName),
//                           EWRequestDictKey:[self requestParameterForProperty:params andMemberCode:memberCode]
//                           };
            break;
        case EWPublicParamsTypeBusiness:
            
            paramsDict = @{
                           EWRequestURLKey : URLHostStringForBusiness(methodName),
                           EWRequestDictKey:[self requestParameterForBusiness:params]
                           };
            
            break;
        case EWPublicParamsTypeIntelligence:
            
            paramsDict = @{
                           EWRequestURLKey : URLHostStringForIntelligence(methodName),
                           EWRequestDictKey:[self requestParameterForIntelligence:params]
                           };
            
            break;
        default:
            break;
    }
    return paramsDict;
}

+(NSDictionary *)getBase64Param:(NSDictionary *)dic {
    NSData *paramData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *params = [paramData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    NSString *strUrl = [params stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSDictionary *param = @{@"appParam": strUrl};
    return param;
}

+ (NSDictionary *)requestParameterForBusiness:dic {
    NSDictionary *fullParam = @{
                                @"callSource":@"3",
                                @"ip":@"",
                                @"os":@"iOS",
                                @"device": [NSString stringWithFormat:@"%@__%@", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion]],
                                @"userId":[[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]?[[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]:@"",
                                @"communityId":[[NSUserDefaults standardUserDefaults] objectForKey:@"communityId"]?[[NSUserDefaults standardUserDefaults] objectForKey:@"communityId"]:@"",
                                @"sessionKey":[[NSUserDefaults standardUserDefaults] objectForKey:@"sessionKey"]?[[NSUserDefaults standardUserDefaults] objectForKey:@"sessionKey"]:@"",
                                @"version":[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
                                @"param":dic
                                
                                };
    SLog(@"fullParamfullParam==%@",fullParam);
    return [self getBase64Param:fullParam];
}

+ (NSDictionary *)requestParameterForProperty:dic andMemberCode:(NSString *)memberCode{
    NSDictionary *fullParam = @{
                                @"callSource":@"3",
                                @"ip":@"",
                                @"os":@"iOS",
                                @"device": [[UIDevice currentDevice] model],
                                @"userId":[[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]?[[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]:@"",
                                @"communityId":[[NSUserDefaults standardUserDefaults] objectForKey:@"communityId"]?[[NSUserDefaults standardUserDefaults] objectForKey:@"communityId"]:@"",
                                @"sessionKey":[[NSUserDefaults standardUserDefaults] objectForKey:@"sessionKey"]?[[NSUserDefaults standardUserDefaults] objectForKey:@"sessionKey"]:@"",
                                @"version":[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
                                @"param":dic,
                                @"memberCode":memberCode
                                };
    return [self getBase64Param:fullParam];
}

+ (NSDictionary *)requestParameterForIntelligence:(id)dic{
    NSDictionary *fullParam = @{
                                
                                };
    
    return dic;
}

@end
