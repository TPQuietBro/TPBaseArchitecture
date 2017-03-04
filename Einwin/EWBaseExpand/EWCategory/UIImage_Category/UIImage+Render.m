

#import "UIImage+Render.h"

@implementation UIImage (Render)

+ (UIImage *)imageRenderWithOriginalName:(NSString *)name{

    UIImage *image = [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)imageRenderWithOriginalImage:(UIImage *)image{
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
