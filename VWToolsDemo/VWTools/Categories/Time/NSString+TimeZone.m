//
//  NSString+TimeZone.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/17.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSString+TimeZone.h"

@implementation NSString (TimeZone)

#pragma mark - +方法
+ (NSString *)calculateTimeDiffrenceStringFromGMTByTimeZone:(NSTimeZone *)tz {
	NSInteger secDiff = tz.secondsFromGMT;
	NSInteger minDiff = secDiff / 60.0;
	NSInteger hour = minDiff / 60;
	NSInteger min = minDiff % 60;
	NSString *timeDiff = [NSString stringWithFormat:@"%02ld:%02ld",hour,min];
	
	if (hour >= 0) {
		timeDiff = [NSString stringWithFormat:@"+%@",timeDiff];
	}
	return timeDiff;
}

+ (NSString *)stringByUTCHourDifferenceWithTimeZoneCode:(NSString *)tzCode forDate:(NSDate *)date {
	NSTimeZone *tz = [NSTimeZone timeZoneWithName:tzCode];
	NSInteger secDiff = tz.secondsFromGMT;	// 当前时间对应时区的 seconds 偏移量
	CGFloat hour = secDiff / 3600.0;
	
	// 例: 纽约夏令时为 -4, 冬令时为 -5
	if (tz.isDaylightSavingTime) {								// -4
		if (![tz isDaylightSavingTimeForDate:date]) {
			hour = hour - 1;
		}
	}else {														// -5
		if ([tz isDaylightSavingTimeForDate:date]) {			// -4
			hour = hour + 1;
		}
	}
	
	NSString *hourStr = [NSString stringWithFormat:@"%.2f",hour];
	return hourStr;
}

#pragma mark - -方法
- (NSString *)convertToTargetDateStringFromSourceTimeZoneName:(NSString *)sourceTzName
										   targetTimeZoneName:(NSString *)targetTzName
											 sourceDateFormat:(NSString *)format {
	
	NSTimeZone *sourceTz = [NSTimeZone timeZoneWithName:sourceTzName];
	NSTimeZone *targetTz = [NSTimeZone timeZoneWithName:targetTzName];
	
	NSDateFormatter *sourceFormatter = [[NSDateFormatter alloc] init];
	[sourceFormatter setTimeZone:sourceTz];
	[sourceFormatter setDateFormat:format];
	
	NSDate *date = [sourceFormatter dateFromString:self];
	
	NSDateFormatter *targetFormatter = [[NSDateFormatter alloc] init];
	[targetFormatter setTimeZone:targetTz];
	[targetFormatter setDateFormat:format];
	
	NSString *targetDateString = [targetFormatter stringFromDate:date];
	return targetDateString;
}

- (NSString *)convertToTargetDateStringFromSourceTimeZoneOffset:(NSString *)sourceTzOffSet
										   targetTimeZoneOffset:(NSString *)targetTzOffSet
											   sourceDateFormat:(NSString *)format {
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:format];
	// 按照 format 将 string 转换成 date
	NSDate *sourceDate = [formatter dateFromString:self];
	// 获取小时偏差
	CGFloat src = [sourceTzOffSet floatValue];
	CGFloat tgt = [targetTzOffSet floatValue];
	// 获取秒值偏差
	NSInteger sourceOffset = src * 3600;
	NSInteger targOffset = tgt * 3600;
	// 得到两个时区之间偏移量的差值
	NSInteger interval = targOffset - sourceOffset;
	// 转为目标时区时间
	NSDate *targetDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:sourceDate];
	NSString *targetDateString = [formatter stringFromDate:targetDate];
	return targetDateString;
}

@end
