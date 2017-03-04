//
//  UILabel+FastSetting.m
//
//  Created by ccpg_it on 17/2/17.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import "UILabel+FastSetting.h"
#define weak __weak typeof(self) weakSelf = self;
@implementation UILabel (FastSetting)

- (blockFont)en_font{
    weak
    return ^UILabel *(id font){
        if ([font isKindOfClass:[UIFont class]]) {
            weakSelf.font = font;
        }else if ([font isKindOfClass:[NSNumber class]]){
            weakSelf.font = [UIFont systemFontOfSize:[font integerValue]];
        }
        return self;
    };
}

- (blockText)en_text{
    weak
    return ^UILabel *(NSString *text){
        weakSelf.text = text;
        return self;
    };
}

- (blockColor)en_customTextColor{
    weak
    return ^UILabel *(UIColor* color){
        if ([color isKindOfClass:[UIColor class]]) {
            weakSelf.textColor = color;
        }else {
            NSException *exception = [NSException exceptionWithName:@"error color type" reason:@"传入了错误的类型" userInfo:nil];
            @throw exception;
        }
        return self;
    };
}

- (blockSystemBlock)en_systemTextColor{
    weak;
    return ^UILabel *(ENLabelColor color){
        switch (color) {
            case ENRedColor:
                weakSelf.textColor = [UIColor redColor];
                break;
            case ENYellowColor:
                weakSelf.textColor = [UIColor yellowColor];
                break;
            case ENBlueColor:
                weakSelf.textColor = [UIColor blackColor];
                break;
            case ENPurpleColor:
                weakSelf.textColor = [UIColor purpleColor];
                break;
            case ENBrownColor:
                weakSelf.textColor = [UIColor brownColor];
                break;
            case ENBlackColor:
                weakSelf.textColor = [UIColor blackColor];
                break;
            case ENWhiteColor:
                weakSelf.textColor = [UIColor whiteColor];
                break;
            case ENGreenColor:
                weakSelf.textColor = [UIColor greenColor];
                break;
            case ENOrangeColor:
                weakSelf.textColor = [UIColor orangeColor];
                break;
        }
        return self;
    };
}

- (blockLabelBgColor)en_bgColor{
    weak
    return ^UILabel *(UIColor* color){
        if ([color isKindOfClass:[UIColor class]]) {
            weakSelf.backgroundColor = color;
        }else {
            NSException *exception = [NSException exceptionWithName:@"error color type" reason:@"传入了错误的类型" userInfo:nil];
            @throw exception;
        }
        return self;
    };
}

- (blockTextAlignment)en_alignment{
    weak
    return ^UILabel *(ENLabelLayoutType alignment){
        switch (alignment) {
            case ENTextAlighmentCenter:
                weakSelf.textAlignment = NSTextAlignmentCenter;
                break;
            case ENTextAlighmentLeft:
                weakSelf.textAlignment = NSTextAlignmentLeft;
                break;
            case ENTextAlighmentRight:
                weakSelf.textAlignment = NSTextAlignmentRight;
                break;
        }
        return self;
    };
}

- (CGFloat)en_textWidth{
    return [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].width;
}

- (CGFloat)en_textHeight{
    return [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].height;
}


@end
