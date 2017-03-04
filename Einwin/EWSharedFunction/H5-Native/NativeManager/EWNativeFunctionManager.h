//
//  ENNativeFunctionManager.h
//  YYZN
//
//  Created by ccpg_it on 17/2/7.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//  H5与JS交互

#import <JavaScriptCore/JavaScriptCore.h>
#import <UIKit/UIKit.h>
#import "MyJSExport.h"

@interface EWNativeFunctionManager : NSObject <ENJSExports>

@property (nonatomic , strong) UIViewController *viewController;

- (instancetype)initWithViewController:(UIViewController *)viewController;

@end
