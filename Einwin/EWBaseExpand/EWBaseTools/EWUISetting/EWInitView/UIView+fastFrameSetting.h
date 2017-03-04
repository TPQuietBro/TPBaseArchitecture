//
//  UIView+fastFrameSetting.h
//  YYZN
//
//  Created by ccpg_it on 17/2/20.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView *(^blockFrameSetting)(CGFloat x,CGFloat y,CGFloat w,CGFloat h);

@interface UIView (fastFrameSetting)

- (blockFrameSetting)en_frame;

@end
