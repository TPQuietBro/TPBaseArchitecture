//
//  ENTableViewDelegate.m
//  YYZN
//
//  Created by ccpg_it on 17/2/14.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "EWTableViewDelegate.h"

@implementation EWTableViewDelegate

+ (instancetype)delegateInViewController:(UIViewController *)viewController WithCallbackBlock:(void(^)(id indexPath))block{
    return [[self alloc] initWithViewController:viewController WithCallbackBlock:block];
}

- (instancetype)initWithViewController:(UIViewController *)viewController WithCallbackBlock:(void(^)(id indexPath))block{
    if (self = [super init]) {
        self.callBackBlock = [block copy];
        self.viewController = viewController;
    }
    return self;
}
@end
