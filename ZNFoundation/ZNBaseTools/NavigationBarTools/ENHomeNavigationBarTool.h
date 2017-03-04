//
//  ENHomeNavigationBarTool.h
//  YYZN
//
//  Created by ccpg_it on 17/1/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ENHomeNavigationBarTool : NSObject
/**隐藏顶部图片*/
+ (void)hideTopImageInVc:(UIViewController *)vc;
/**显示顶部图片*/
+ (void)showTopImageInVc:(UIViewController *)vc;
@end
