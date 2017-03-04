//
//  YYSHTabBarView.m
//  YYSHDemo
//
//  Created by ccpg_it on 16/11/25.
//  Copyright © 2016年 ccpg_it. All rights reserved.
//

#import "YYZNTabBarView.h"
#import "YYZNTarBarButton.h"

@interface YYZNTabBarView()
/**背景*/
@property (nonatomic , weak) UIImageView *imageView;
/**选中的按钮*/
@property (nonatomic , weak) UIButton *selectedBtn;
/**保存按钮的数组*/
@property (nonatomic , strong) NSMutableArray *indexButtonArray;
/**中间圆形按钮*/
@property (nonatomic , strong) UIButton *circleButton;
@end

@implementation YYZNTabBarView

- (instancetype)initWithTarBarTitle:(NSArray *)tabBarTitle andCricleImage:(UIImage *)cirleImage andTabBarStyle:(ENTabBarsStyle)tabBarStyle{
    if (tabBarTitle.count == 0) {
        SLog(@"标题数组不能为空");
        return nil;
    }
    self = [super init];
    if (self) {
        self.tabBarTitle = tabBarTitle;
        self.tabBarStyle = tabBarStyle;
        self.cirleImage = cirleImage;
        [self setup];
    }
    return self;
}

- (instancetype)initWithTarBarTitle:(NSArray *)tabBarTitle andTabBarStyle:(ENTabBarsStyle)tabBarStyle{
    
    if (tabBarTitle.count == 0) {
        SLog(@"标题数组不能为空");
        return nil;
    }
    self = [super init];
    if (self) {
        self.tabBarTitle = tabBarTitle;
        self.tabBarStyle = tabBarStyle;
        [self setup];
    }
    return self;
}

#pragma mark - init method
- (void)setup{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"daohang"];
    self.imageView = imageView;
    [self addSubview:imageView];
    for (NSInteger i = 0; i < tarBarButtonCount; ++i) {
        YYZNTarBarButton *tarBarButton = [YYZNTarBarButton buttonWithType:UIButtonTypeCustom];
        [tarBarButton setBackgroundImage:[UIImage imageNamed:@"daohangselect"] forState:UIControlStateSelected];
        [tarBarButton setTitle:self.tabBarTitle[i] forState:UIControlStateNormal];
        [tarBarButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [tarBarButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        tarBarButton.titleLabel.font = Font48;
        [tarBarButton addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tarBarButton];
        if (i == 0) {
            tarBarButton.selected = YES;
            self.selectedBtn = tarBarButton;
        }
        tarBarButton.tag = tarBarButtonTag + i;
        [self.indexButtonArray addObject:tarBarButton];
    }
    
}
#pragma mark - event resonpse
- (void)clickBtn:(UIButton *)sender{
    [self clickSelectedButton:sender];
    if ([self.delegate respondsToSelector:@selector(didClickIndexButton:AndIndex:)]) {
        [self.delegate didClickIndexButton:self AndIndex:sender.tag - tarBarButtonTag];
    }
}

- (void)clickCircleButton:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(didClickCircleButton:circleButton:)]) {
        [self.delegate didClickCircleButton:self circleButton:button];
    }
}

#pragma mark - laytousubviews

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    
    //布局按钮
    CGFloat h = tarBarHeight;
    CGFloat w = 0;
    
    switch (self.tabBarStyle) {
            //普通样式
        case ENTabBarStyleNormal:
            w = EW_ScreenW / tarBarButtonCount;
            for (UIButton *button in self.indexButtonArray) {
                button.frame = CGRectMake(w * (button.tag - tarBarButtonTag), 0, w, h);
            }
            break;
            //圆圈按钮
        case ENTabBarStyleCircle:
            [self addSubview:self.circleButton];
            w = EW_ScreenW / (tarBarButtonCount + 1);
            
            for (NSInteger i = 0; i < tarBarButtonCount; ++i) {
                UIButton *button = self.indexButtonArray[i];
                button.frame = CGRectMake(w * (button.tag - tarBarButtonTag), 0, w, h);
                if (i >= 2) {
                    button.frame = CGRectMake(w * (button.tag - tarBarButtonTag + 1) , 0, w, h);
                }
            }
            //设置中间按钮
            self.circleButton.centerX = self.width / 2;
            self.circleButton.centerY = self.height / 2 - 10;
            self.circleButton.width = 44;
            self.circleButton.height = 44;
            break;
        default:
            break;
    }
}
#pragma mark - private method
- (void)clickSelectedButton:(UIButton *)curButton{
    self.selectedBtn.selected = NO;
    curButton.selected = YES;
    self.selectedBtn = curButton;
}

#pragma mark - getter

- (NSMutableArray *)indexButtonArray{
    if (!_indexButtonArray) {
        _indexButtonArray = [NSMutableArray array];
    }
    return _indexButtonArray;
}

- (UIButton *)circleButton{
    if (!_circleButton) {
        _circleButton = [[UIButton alloc] init];
        [_circleButton setBackgroundImage:self.cirleImage forState:UIControlStateNormal];
        [_circleButton addTarget:self action:@selector(clickCircleButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _circleButton;
}

@end
