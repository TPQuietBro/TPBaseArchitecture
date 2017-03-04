//
//  ENJudgeVcTool.h
//  YYZN
//
//  Created by ccpg_it on 17/1/18.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ENJudgeVcTool : NSObject
/*
 * 用于返回一个适合的vc
 */
+ (UIViewController *)judgeVc:(id)vc;
@end
