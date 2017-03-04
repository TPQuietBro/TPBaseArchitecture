//
//  UIViewController+ReverseValue.m
//  YYZN
//
//  Created by allentang on 2017/2/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "UIViewController+ReverseValue.h"
#import <objc/message.h>

static char *reverseBlockKey = "reverseBlockKey";

@implementation UIViewController (ReserveValue)

- (reverseBlock)reserveValue{
    return objc_getAssociatedObject(self, reverseBlockKey);
}

- (void)setReserveValue:(reverseBlock)reserveValue{
    objc_setAssociatedObject(self, reverseBlockKey, reserveValue, OBJC_ASSOCIATION_COPY_NONATOMIC);

}


@end
