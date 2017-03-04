//
//  UIButton+click.h
//  YYZN
//
//  Created by ccpg_it on 17/2/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (click)
- (instancetype)initWithCallBackButtonClickBlock:(void (^)(UIButton *button))callbackBlock;
@end
