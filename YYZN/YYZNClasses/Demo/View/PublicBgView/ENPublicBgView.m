//
//  ENPublicBgView.m
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "ENPublicBgView.h"

@implementation ENPublicBgView

+ (instancetype)publicBgView{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
}

@end
