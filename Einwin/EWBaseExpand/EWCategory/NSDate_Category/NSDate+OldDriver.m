

#import "NSDate+OldDriver.h"

@implementation NSDate (OldDriver)
/**
 *  得到今天的日期
 */
- (NSString *)today{
    
    NSDateFormatter *fm = [[NSDateFormatter alloc] init];
    fm.dateFormat = @"yyyy-MM-dd";
    NSDate *now = [[NSDate alloc] init];
    
    return [fm stringFromDate:now];
}
/**
 *  判断是不是今天
 */
- (BOOL)isToday:(NSString *)dateString{
    return [dateString isEqualToString:[self today]];
}

/**
 *  判断是不是昨天
 */
- (BOOL)isLastDay:(NSString *)dateString{
    NSTimeInterval todayTimesStamp = [self getTimestamp:[self today]];
    NSTimeInterval lastTimesStamp = [self getTimestamp:dateString];
    return lastTimesStamp == (todayTimesStamp-(24*60*60));
}

/**
 *  日期转换
 */
- (NSString *)formattDay:(NSString *)dateString{
    if (dateString.length <= 0)
    {
        return @"errorDate";
    }
    NSDateFormatter *fm = [[NSDateFormatter alloc] init];
    fm.dateFormat = @"yyyy-MM-dd";
    
    NSDate *date = [fm dateFromString:dateString];
    
    NSDateFormatter *newFm = [[NSDateFormatter alloc] init];
    newFm.dateFormat = @"MM月dd日";
    return [newFm stringFromDate:date];
}
/**
 *  获取时间戳
 */
- (NSTimeInterval)getTimestamp:(NSString *)dateString{
    if (dateString.length <= 0)
    {
        return 0;
    }
    NSString *newDateString = [dateString stringByAppendingString:@" 00:00:00"];
    NSDateFormatter *fm = [[NSDateFormatter alloc] init];
    fm.dateStyle = kCFDateFormatterMediumStyle;
    fm.dateStyle = kCFDateFormatterShortStyle;
    fm.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    fm.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    NSDate *dateNow = [fm dateFromString:newDateString];
    return [dateNow timeIntervalSince1970];
}

/**
 *  获取星期几
 */
- (NSString *)weekWithDateString:(NSString *)dateString{
    NSTimeInterval timesTamp = [self getTimestamp:dateString];
    NSInteger day = timesTamp / 86400;
    NSArray *array = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日"];
    
    return array[(day - 3) % 7];

}

@end
