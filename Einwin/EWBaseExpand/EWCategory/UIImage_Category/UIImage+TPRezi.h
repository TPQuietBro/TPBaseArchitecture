//
//  UIImage+TPRezi.h
//  图片拉伸
//
//  Created by 唐鹏 on 14/4/23.
//  Copyright © 2014年 tangpeng. All rights reserved.
//  拉伸图片,保护处理

#import <UIKit/UIKit.h>

@interface UIImage (TPRezi)
/**获取保护图片*/
+(UIImage *)reziWithImageName:(NSString *)name;
/**自定义尺寸的图片*/
+(UIImage *)imageWithCustomSize:(CGSize)size imageName:(NSString *)name;
@end
