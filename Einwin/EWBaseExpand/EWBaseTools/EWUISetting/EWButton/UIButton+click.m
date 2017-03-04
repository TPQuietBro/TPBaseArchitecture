//
//  UIButton+click.m
//  YYZN
//
//  Created by ccpg_it on 17/2/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "UIButton+click.h"
#import <objc/message.h>

#define weak __weak typeof(self) weakSelf = self;
char * CALLBACK_BLOCK_IDENTIFER = "CALLBACK_BLOCK_IDENTIFER";

@interface UIButton()
//动态添加私有属性
@property (nonatomic, copy) void (^callbackBlock)(UIButton * button);

@end

@implementation UIButton (click)

- (void (^)(UIButton *))callbackBlock {
    return objc_getAssociatedObject(self, CALLBACK_BLOCK_IDENTIFER);
}
- (void)setCallbackBlock:(void (^)(UIButton *))callbackBlock {
    objc_setAssociatedObject(self, CALLBACK_BLOCK_IDENTIFER, callbackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (instancetype)initWithCallBackButtonClickBlock:(void (^)(UIButton *))callbackBlock
{
    self = [super init];
    if (self) {
        self.callbackBlock = callbackBlock;
        [self addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)clickButton:(UIButton *)sender{
    weak
    weakSelf.callbackBlock(sender);
}

@end
