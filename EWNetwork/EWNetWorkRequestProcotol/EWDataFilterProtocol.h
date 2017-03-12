//
//  EWDataFilterProtocol.h
//  YYZN
//
//  Created by ccpg_it on 17/3/1.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  过滤数据的协议

#import <Foundation/Foundation.h>
@class EWAPIBaseManager;

@protocol EWDataFilterProtocol <NSObject>
/**
 * 过滤方法,传入一个请求实例和请求的数据,返回过滤后的数据
 */
- (id)manager:(EWAPIBaseManager *)manager filterData:(id)data;

@end
