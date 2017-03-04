//
//  UIView+fastFrameSetting.m
//  YYZN
//
//  Created by ccpg_it on 17/2/20.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "UIView+fastFrameSetting.h"

@implementation UIView (fastFrameSetting)

- (blockFrameSetting)en_frame{
    return ^UIView *(CGFloat x,CGFloat y,CGFloat w,CGFloat h){
        self.frame = CGRectMake(x, y, w, h);
        return self;
    };
}

@end
