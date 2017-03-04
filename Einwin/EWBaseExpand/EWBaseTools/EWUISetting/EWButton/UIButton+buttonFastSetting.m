//
//  UIButton+buttonFastSetting.m
//  链式编程demo
//
//  Created by ccpg_it on 17/2/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "UIButton+buttonFastSetting.h"

#define weak __weak typeof(self) weakSelf = self;

@implementation UIButton (buttonFastSetting)

- (blockNormalTitle)en_normalTitle{
    weak
    return ^UIButton *(NSString *text){
        [weakSelf setTitle:text forState:UIControlStateNormal];
        return self;
    };
}

- (blockSelectedTitle)en_selectedTitle{
    weak
    return ^UIButton *(NSString *text){
        [weakSelf setTitle:text forState:UIControlStateSelected];
        return self;
    };
}

- (blockHighLightTitle)en_highLightTitle{
    weak
    return ^UIButton *(NSString *text){
        [weakSelf setTitle:text forState:UIControlStateHighlighted];
        return self;
    };
}

- (blockButtonFont)en_font{
    weak
    return ^UIButton *(id font){
        if ([font isKindOfClass:[UIFont class]]) {
            weakSelf.titleLabel.font = font;
        }else if ([font isKindOfClass:[NSNumber class]]){
            weakSelf.titleLabel.font = [UIFont systemFontOfSize:[font integerValue]];
        }
        return self;
    };
}

- (blockNormalTitleColor)en_normalTitleColor{
    weak
    return ^UIButton *(UIColor *color){
        [weakSelf setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (blockSelectedTitleColor)en_selectedTitleColor{
    weak
    return ^UIButton *(UIColor *color){
        [weakSelf setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (blockHighLightTitleColor)en_highLightTitleColor{
    weak
    return ^UIButton *(UIColor *color){
        [weakSelf setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

- (blockBgColor)en_bgColor{
    weak
    return ^UIButton *(UIColor *color){
        [weakSelf setBackgroundColor:color];
        return self;
    };
}

@end
