//
//  NSString+TimeRemainDescription.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/7/4.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSString+TimeRemainDescription.h"

@implementation NSString (TimeRemainDescription)

+ (NSTimeInterval)timeIntervalWithUTCString:(NSString *)dateString {
	
	NSDateFormatter *utcDateFormatter = [[NSDateFormatter alloc] init];
	[utcDateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	[utcDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *utcDate = [utcDateFormatter dateFromString:dateString];
	
	NSTimeInterval interval = [utcDate timeIntervalSinceNow];
	return interval;
}

+ (NSString *)timeRemainDescriptionWithUTCString:(NSString *)dateString {
	
	NSString *minuteStr = @"分钟";
	NSString *hourStr = @"小时";
	NSString *dayStr = @"天";
	
	NSTimeInterval interval = [self timeIntervalWithUTCString:dateString];
	
	
	NSString *before = @"";
	
	if (interval < 0) {
		interval = -interval;
		before = @"前";
	}
	
	CGFloat minute = interval / 60.0f;
	if (minute < 60.0f) {
		if (minute < 1.0f) {
			return @"刚刚";
		}
		return [NSString stringWithFormat:@"%.f%@%@", minute, minuteStr, before];
	} else {
		CGFloat hour = minute / 60.0f;
		if (hour < 24.0f) {
			return [NSString stringWithFormat:@"%.f%@%@", hour, hourStr, before];
		} else {
			CGFloat day = hour / 24.0f;
			if (day < 7.0f) {
				return [NSString stringWithFormat:@"%.f%@%@", day, dayStr, before];
			} else {
				NSArray *dateArray = [self localDateStringWithUTCString:dateString];
				if (dateArray.count == 2) {
					return dateArray[0];
				} else {
					return dateString;
				}
			}
		}
	}
	return nil;
}

+ (NSString *)timeRemainDescriptionWithDateSP:(NSNumber *)dateSP {
	
	NSDate *timesp = [NSDate dateWithTimeIntervalSince1970:[dateSP floatValue]];
	NSDateFormatter *utcDateFormatter = [[NSDateFormatter alloc] init];
	[utcDateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	[utcDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSString *dateString = [utcDateFormatter stringFromDate:timesp];
	
	return [self timeRemainDescriptionWithUTCString:dateString];
}

#pragma mark - Internal

+ (NSArray *)localDateStringWithUTCString:(NSString *)dateString {
	
	NSDateFormatter *utcDateFormatter = [[NSDateFormatter alloc] init];
	[utcDateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
	[utcDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *utcDate = [utcDateFormatter dateFromString:dateString];
	
	NSDateFormatter *localDateFormatter = [[NSDateFormatter alloc] init];
	[localDateFormatter setTimeZone:[NSTimeZone localTimeZone]];
	[localDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
	NSString *localTimeString = [localDateFormatter stringFromDate:utcDate];
	NSArray *localArray = [localTimeString componentsSeparatedByString:@" "];
	return localArray;
	
}

@end
