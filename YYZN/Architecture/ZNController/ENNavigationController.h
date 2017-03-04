//
//  ENNavigationController.h
//  YYZN
//
//  Created by ccpg_it on 17/1/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ENNavigationController : UINavigationController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
/**顶部显示一应智能的logo*/
@property (nonatomic , strong) UIImageView *topLogoImageView;
/**顶部显示扫描的图片*/
@property (nonatomic , strong) UIImageView *topScanImageView;
@end
