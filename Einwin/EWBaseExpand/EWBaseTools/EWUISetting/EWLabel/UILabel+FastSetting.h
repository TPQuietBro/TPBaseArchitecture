//
//  UILabel+FastSetting.h
//
//  Created by ccpg_it on 17/2/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ENLabelLayoutType)
{
    ENTextAlighmentLeft = 0,
    ENTextAlighmentRight = 1,
    ENTextAlighmentCenter = 2
};

typedef NS_ENUM(NSInteger, ENLabelColor)
{
    ENRedColor = 0,
    ENBlueColor = 1,
    ENPurpleColor = 2,
    ENBrownColor = 3,
    ENGreenColor = 4,
    ENOrangeColor = 5,
    ENYellowColor = 6,
    ENWhiteColor = 7,
    ENBlackColor = 8
};


typedef UILabel *(^blockText)(NSString *string);
typedef UILabel *(^blockFont)(id font);
typedef UILabel *(^blockColor)(UIColor* color);
typedef UILabel *(^blockSystemBlock)(ENLabelColor color);
typedef UILabel *(^blockLabelBgColor)(UIColor* color);
typedef UILabel *(^blockTextAlignment)(ENLabelLayoutType alignment);

@interface UILabel (FastSetting)
//设置text
- (blockText)en_text;
//设置字体
- (blockFont)en_font;
//设置自定义字体颜色
- (blockColor)en_customTextColor;
//设置字体为系统颜色
- (blockSystemBlock)en_systemTextColor;
//设置背景颜色
- (blockLabelBgColor)en_bgColor;
//设置布局
- (blockTextAlignment)en_alignment;
//根据text,font获取宽度
- (CGFloat)en_textWidth;
//根据text,font获取高度
- (CGFloat)en_textHeight;

@end
