//
//  UIButton+buttonFastSetting.h
//  链式编程demo
//
//  Created by ccpg_it on 17/2/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIButton *(^blockNormalTitle)(NSString *string);
typedef UIButton *(^blockHighLightTitle)(NSString *string);
typedef UIButton *(^blockSelectedTitle)(NSString *string);
typedef UIButton *(^blockButtonFont)(id font);
typedef UIButton *(^blockBgColor)(UIColor *bgColor);
typedef UIButton *(^blockHighLightTitleColor)(UIColor *titleColor);
typedef UIButton *(^blockNormalTitleColor)(UIColor *titleColor);
typedef UIButton *(^blockSelectedTitleColor)(UIColor *titleColor);

@interface UIButton (buttonFastSetting)
//普通标题
- (blockNormalTitle)en_normalTitle;
//高亮标题
- (blockHighLightTitle)en_highLightTitle;
//选中标题
- (blockSelectedTitle)en_selectedTitle;
//字体
- (blockButtonFont)en_font;
//背景颜色
- (blockBgColor)en_bgColor;
//普通下字体颜色
- (blockNormalTitleColor)en_normalTitleColor;
//选中后的字体颜色
- (blockSelectedTitleColor)en_selectedTitleColor;
//高亮下的字体颜色
- (blockHighLightTitleColor)en_highLightTitleColor;

@end
