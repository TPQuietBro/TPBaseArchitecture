

#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image HighlightImage:(UIImage *)hightlightImage Target:(id)target Action:(SEL)action{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:hightlightImage forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    UIView *btnView = [[UIView alloc] init];
    [btnView addSubview:button];
    
    btnView.frame = button.frame;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btnView];
}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image SelectedImage:(UIImage *)SelectedImage Target:(id)target Action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:SelectedImage forState:UIControlStateSelected];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    UIView *btnView = [[UIView alloc] init];
    [btnView addSubview:button];
    
    btnView.frame = button.frame;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btnView];
}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image HighlightImage:(UIImage *)hightlightImage Target:(id)target Action:(SEL)action Frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:hightlightImage forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = frame;
    UIView *btnView = [[UIView alloc] init];
    [btnView addSubview:button];
    
    btnView.frame = button.frame;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btnView];
}

@end
