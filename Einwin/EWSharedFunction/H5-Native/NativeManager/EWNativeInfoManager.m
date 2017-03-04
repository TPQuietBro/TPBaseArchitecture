//
//  ENNativeInfoManager.m
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWNativeInfoManager.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation EWNativeInfoManager
+ (void)getNativeAccountInfoByJSContext:(JSContext *)context{
    JSValue *funcName = context[@"eningLoginCallback"];
    NSString *phoneNumber = @"136xxxxxxxx";
    NSString *nickName = @"ls";
    NSDictionary *dict = @{@"phone":phoneNumber,@"nickName":nickName};
    [funcName callWithArguments:@[[NSString stringWithFormat:@"回调的信息:%@",[JSONManager dictionaryToJson:dict]]]];
}
@end
