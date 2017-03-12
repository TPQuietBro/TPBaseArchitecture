//
//  TestDataFilter.m
//  YYZN
//
//  Created by ccpg_it on 17/3/1.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "TestDataFilter.h"
#import "TestItem.h"
#import "TestAPIManger.h"

@implementation TestDataFilter

- (id)manager:(EWAPIBaseManager *)manager filterData:(id)data{
    if ([manager isKindOfClass:[TestAPIManger class]]) {
        return [self filterTestApiDataFromJSON:data];
    }
    return nil;
}

- (id)filterTestApiDataFromJSON:(id)json{
    NSArray *data = [TestItem mj_objectArrayWithKeyValuesArray:json[@"videos"]];
    return data;
}

@end
