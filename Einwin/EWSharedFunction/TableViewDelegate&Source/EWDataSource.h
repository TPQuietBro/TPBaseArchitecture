//
//  ENDataSource.h
//  封装dataSource
//
//  Created by 唐鹏 on 16/3/12.
//  Copyright © 2016年 tangpeng. All rights reserved.
//  将datasource封装,给控制器减压

#import <UIKit/UIKit.h>

@interface EWDataSource : NSObject<UITableViewDataSource>

+ (instancetype)dataSourceWithIdentifier:(NSString *)identifier values:(NSArray *)values callBackBlock:(void(^)(id item,id cell))block customCell:(NSString *)customCell;

- (instancetype)initWithDataSourceWithIdentifier:(NSString *)identifier values:(NSArray *)values callBackBlock:(void(^)(id item,id cell))block customCell:(NSString *)customCell;

@end
