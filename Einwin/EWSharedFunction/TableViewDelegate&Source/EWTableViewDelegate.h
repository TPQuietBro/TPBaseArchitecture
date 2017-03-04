//
//  ENTableViewDelegate.h
//  YYZN
//
//  Created by ccpg_it on 17/2/14.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  这个类提供基本的初始化方法,及参数,具体怎么处理,交给分类去完成

#import <Foundation/Foundation.h>

@interface EWTableViewDelegate : NSObject<UITableViewDelegate>

+ (instancetype)delegateInViewController:(UIViewController *)viewController WithCallbackBlock:(void(^)(id indexPath))block;

- (instancetype)initWithViewController:(UIViewController *)viewController WithCallbackBlock:(void(^)(id indexPath))block;

@property (nonatomic,strong) void(^callBackBlock)(id indexPath);

@property (nonatomic , strong) UIViewController *viewController;

@end
