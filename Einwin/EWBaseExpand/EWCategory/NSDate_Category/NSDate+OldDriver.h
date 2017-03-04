

//用于日期操作
#import <Foundation/Foundation.h>

@interface NSDate (OldDriver)
/**获取今天*/
- (NSString *)today;
/**判断是不是今天*/
- (BOOL)isToday:(NSString *)dateString;
/**判断是不是昨天*/
- (BOOL)isLastDay:(NSString *)dateString;
/**获取时间戳*/
- (NSTimeInterval)getTimestamp:(NSString *)dateString;
/**获取获取星期几*/
- (NSString *)weekWithDateString:(NSString *)dateString;
/**格式化日期*/
- (NSString *)formattDay:(NSString *)dateString;
@end
