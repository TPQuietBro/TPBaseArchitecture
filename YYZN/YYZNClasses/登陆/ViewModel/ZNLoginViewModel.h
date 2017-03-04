//
//  ZNLoginViewModel.h
//  YYZN
//
//  Created by CCPG_iOS on 2017/3/1.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  这个类是针对于每个网络请求的api

#import "EWBaseViewModel.h"
@class CSSHomeView;
@interface ZNLoginViewModel : EWBaseViewModel

/**
 * 初始化请求实例
 */

- (instancetype)initWithView:(CSSHomeView *)homeView1;

@property (weak,nonatomic) id <ZNPushProtocol> delegate;


@end
