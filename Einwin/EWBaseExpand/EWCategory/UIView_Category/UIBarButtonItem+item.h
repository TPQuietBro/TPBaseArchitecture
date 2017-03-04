

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)

/**点击是高亮状态*/
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image HighlightImage:(UIImage *)hightlightImage Target:(id)target Action:(SEL)action;

/**点击是选中状态*/
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image SelectedImage:(UIImage *)SelectedImage Target:(id)target Action:(SEL)action;

/**自定义frame*/

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image HighlightImage:(UIImage *)hightlightImage Target:(id)target Action:(SEL)action Frame:(CGRect)frame;
@end
