
//用于获取不经渲染的图片
#import <UIKit/UIKit.h>

@interface UIImage (Render)
+ (UIImage *)imageRenderWithOriginalName:(NSString *)name;
+ (UIImage *)imageRenderWithOriginalImage:(UIImage *)image;
@end
