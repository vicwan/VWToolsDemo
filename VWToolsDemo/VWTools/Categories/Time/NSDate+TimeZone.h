//
//  NSDate+TimeZone.h
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/18.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TimeZone)

/**
 根据传进来的时区和时间字符串, 转成对应的 UTC 时间

 @param timeString 传入时区中的时间字符串
 @param tzCode 时区 code
 @param dateFormat timeString 的格式
 @return 返回传入时区的时间, 对应的 UTC 时间.
 */
+ (NSDate *)targetUTCDateFromTimeString:(NSString *)timeString
						   timeZoneCode:(NSString *)tzCode
					   sourceDateFormat:(NSString *)dateFormat;

+ (NSDate *)targetUTCDateFromTimeString:(NSString *)timeString
							   timeZone:(NSTimeZone *)tz
					   sourceDateFormat:(NSString *)dateFormat;

@end
