//
//  ENBaseViewModel.h
//  YYZN
//
//  Created by ccpg_it on 17/2/21.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  父类声明两基础个方法,请求数据,过滤数据

#import <Foundation/Foundation.h>

@interface EWBaseViewModel : NSObject

/**
 * 开始请求数据
 */
- (void)start;

/**
 * 在某个页面刷新数据
 */
- (void)refreshDataInView:(UIView *)view withData:(id)data;

@end
