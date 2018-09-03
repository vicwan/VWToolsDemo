//
//  NSDate+TimeZone.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/18.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSDate+TimeZone.h"

@implementation NSDate (TimeZone)

+ (NSDate *)targetUTCDateFromTimeString:(NSString *)timeString
						   timeZoneCode:(NSString *)tzCode
					   sourceDateFormat:(NSString *)dateFormat {
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:tzCode]];
	[dateFormatter setDateFormat:dateFormat];
	NSDate *utcDate = [dateFormatter dateFromString:timeString];
	
	return utcDate;
}

+ (NSDate *)targetUTCDateFromTimeString:(NSString *)timeString
							   timeZone:(NSTimeZone *)tz
					   sourceDateFormat:(NSString *)dateFormat {
	
	NSString *tzName = tz.name;
	return [self targetUTCDateFromTimeString:timeString timeZoneCode:tzName sourceDateFormat:dateFormat];
}

@end
