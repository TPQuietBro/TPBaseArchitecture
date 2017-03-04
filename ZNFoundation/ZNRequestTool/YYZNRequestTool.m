//
//  ENRequestTool.m
//  YYZN
//
//  Created by ccpg_it on 17/1/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "YYZNRequestTool.h"

@interface YYZNRequestTool()

@end

@implementation YYZNRequestTool

+ (instancetype)shareInstance{
    static YYZNRequestTool *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}


@end
