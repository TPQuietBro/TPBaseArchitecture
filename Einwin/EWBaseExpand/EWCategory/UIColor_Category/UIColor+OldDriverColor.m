

#import "UIColor+OldDriverColor.h"

@implementation UIColor (OldDriverColor)
+ (UIColor *)getHexColor:(NSString *)hexColor{

    //获取16进制的颜色
        unsigned int red,green,blue;
        NSRange range;
        range.length = 2;

        range.location = 0;
        
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
        
        range.location = 2;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
        
        range.location = 4;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
        
        return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
    
}
@end
