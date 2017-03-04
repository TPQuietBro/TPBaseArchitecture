//
//  EWParamsSplitJoint.h
//  YYZN
//
//  Created by ccpg_it on 17/2/28.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  负责参数拼接

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,EWPublicParamsType){
    //物业
    EWPublicParamsTypeProperty,
    //社商
    EWPublicParamsTypeBusiness,
    //智能
    EWPublicParamsTypeIntelligence
};

@interface EWParamsSplitJoint : NSObject

+ (NSDictionary *)splitJointPublicParamsWithMethodName:(NSString *)methodName andParams:(NSDictionary *)params memberCode:(NSString *)memberCode paramsType:(EWPublicParamsType)paramsType;

+ (NSDictionary *)requestParameterForBusiness:dic;

+ (NSDictionary *)requestParameterForProperty:dic andMemberCode:(NSString *)memberCode;

+ (NSDictionary *)requestParameterForIntelligence:dic;

@end
