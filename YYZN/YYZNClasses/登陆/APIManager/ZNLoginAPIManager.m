/**
 
 ***************************************************************************************
 * 创建者  ：信息技术中心
 * 创建时间: 2017/3/1
 * 创建目的：
 ***************************************************************************************
 * 更新者 ：
 * 更新时间:
 * 更新内容:
 ***************************************************************************************
 ****************  该文件为深圳一应社区商务集团有限公司版权所有，未经允许不可更改   ****************
 Created by CCPG_iOS on 2017/3/1
   Copyright © 2017年 ccpg_it. All rights reserved.
 ********************************** 信息技术中心 *****************************************
 
 **/

#import "ZNLoginAPIManager.h"
#import "EWParamsSplitJoint.h"
#import "GTMBase64.h"
#import "NSString+DictToJSON.h"
@interface ZNLoginAPIManager ()

@end

@implementation ZNLoginAPIManager

/**
 * function : 返回请求的方式
 * EWRequestType : 需要的请求方式
 *
 EWAPIRequestTypeGet = 0,
 EWAPIRequestTypePost = 1,
 EWAPIRequestTypeUploadImage = 2
 */
- (EWRequestType)requestType{
    return EWAPIRequestTypePost;
}
/**
 * 请求的方法,返回的是接口路径
 */
- (NSString *)requestMethod{
    return @"User/Login";
}
/**
 * 请求需要的参数
 */
- (NSDictionary *)params{
    
    NSDictionary *temp = @{
                           @"requestInfo":
                               @{
                                   @"BusinessId":[self.outerParams objectForKey:@"memberCode"],
                                   @"UserName":[self.outerParams objectForKey:@"user"],
                                   @"EncryptedPassword":[GTMBase64 encodeBase64String:[self.outerParams objectForKey:@"password"]],
                                   }
                           };
    
    
    return temp;
}
/**
 * 是否需要缓存,返回类型是一个NSNumber,大于0就开启缓存
 */
- (NSNumber *)shouldCache{
    return @12;
}
/**
 * 是否需要动画,这里的类可以自定义,但是方法名和类名,必须对应
 * 执行动画的类->EWRequestAnimationTarget : @"ZNRequestAnimation",
 * 开始动画的方法->EWShowHudAnimation : @"showHudAnimation",
 * 结束动画的方法->EWHideHudAtWindow : @"hideHudAtWindow"
 */
- (NSDictionary *)animationTargetAction{
    return @{
             EWRequestAnimationTarget : @"ZNRequestAnimation",
             EWShowHudAnimation : @"showHudAnimation",
             EWHideHudAtWindow : @"hideHudAtWindow"
             };
}

/**
 * 物业可能包含的membercode
 */
- (NSString *)memberCode{
    return @"CCPG";
}
/**
 * 一应智能包含的自定义requestHeader,此方法可选
 */

- (NSDictionary *)headerDict{
    
    return [self readDataFromDataBase];

}

/**
 * 读取保存的登陆数据
 */
- (NSDictionary *)readDataFromDataBase{

    [[EWFMDBManager shareManager] openDataBase:dataPath(@"yyzn.db")];
    
    FMResultSet *result = [[EWFMDBManager shareManager] queryData:@"select * from zn_loginUserInfo"];
    NSString *name = nil;
    NSString *passWord = nil;
    NSString *memCode = nil;
    while ([result next]) {
        name = [result stringForColumn:@"name"];
        passWord = [result stringForColumn:@"password"];
        memCode = [result stringForColumn:@"memberCode"];
    }
    
    [[EWFMDBManager shareManager] closeDataBase];
    return @{
             @"UserName" : name,
             @"Password" : passWord,
             @"BusinessId" : memCode
             };
}

/**
 * 拼接完整的请求参数
 * paramsType 是以下三种宏,针对不同的接口
 //物业
 EWPublicParamsTypeProperty,
 //社商
 EWPublicParamsTypeBusiness,
 //智能
 EWPublicParamsTypeIntelligence
 */
- (NSDictionary *)paramsForAPI{
    //拼接请求的字典参数
    NSDictionary *paramsS = [EWParamsSplitJoint splitJointPublicParamsWithMethodName:[self requestMethod] andParams:[self params] memberCode:[self memberCode] paramsType:EWPublicParamsTypeIntelligence];
    //整理成请求需要的字典格式
//    SLog(@"1234%@",[NSDictionary getParamsDictWithURL:paramsS[EWRequestURLKey] paramsDict:paramsS[EWRequestDictKey] cacheTime:[self shouldCache] customRequest:[self customRequest]]);
    return [NSDictionary getParamsDictWithURL:paramsS[EWRequestURLKey] paramsDict:paramsS[EWRequestDictKey] cacheTime:[self shouldCache] headerDict:[self headerDict]];
}


@end
