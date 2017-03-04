//
//  UIImage+TPRezi.h
//  图片拉伸
//
//  Created by 唐鹏 on 14/4/23.
//  Copyright © 2014年 tangpeng. All rights reserved.
//

#import "UIImage+TPRezi.h"

@implementation UIImage (TPRezi)

+(UIImage *)reziWithImageName:(NSString *)name{
    
    UIImage *image = [UIImage imageNamed:name];
    
    //获取图片高度
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    
    //设置保护区域,拉伸图片
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5 -1, imageW * 0.5 - 1) resizingMode:UIImageResizingModeTile];
    
    return  image;
}

+(UIImage *)imageWithCustomSize:(CGSize)size imageName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
    
}

@end
