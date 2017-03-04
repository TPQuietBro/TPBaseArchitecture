//
//  UIViewController+ReverseValue.h
//  YYZN
//
//  Created by allentang on 2017/2/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^reverseBlock)(id reserveValue);

@interface UIViewController (ReserveValue)

@property (nonatomic,copy) reverseBlock reserveValue;

@end
