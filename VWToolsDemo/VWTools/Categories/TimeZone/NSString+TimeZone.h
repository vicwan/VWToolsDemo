//
//  NSString+TimeZone.h
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/17.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (TimeZone)

#pragma mark - +方法
/**
 计算时差, 生成时差字符串 (私有方法)
 
 @param tz 时区对象
 @return 时差字符串, 例如 +8:00, -9:45
 */
+ (NSString *)calculateTimeDiffrenceStringFromGMTByTimeZone:(NSTimeZone *)tz;

/**
 根据时区编码生成对应的相对于 GMT 的小时偏差
 
 @param tzCode 时区编码
 @return 小时偏差如: 8, 9.5, -10, -10.5
 */
+ (NSString *)stringByUTCHourDifferenceWithTimeZoneCode:(NSString *)tzCode
												forDate:(NSDate *)date;

#pragma mark - -方法
/**
 self 为待转换的日期 string
 
 @param sourceTzName 待转换时区
 @param targetTzName 目标时区
 @param format self 的日期格式
 @return 返回按照时区转换后的日期 string
 */
- (NSString *)convertToTargetDateStringFromSourceTimeZoneName:(NSString *)sourceTzName
										   targetTimeZoneName:(NSString *)targetTzName
											 sourceDateFormat:(NSString *)format;

/**
 类似上面的方法, 但传入 +8, -9.5 格式的 hour offset
 self 为待转换的日期 string
 
 @param sourceTzOffSet 待转换时区的 hour offset
 @param targetTzOffSet 目标时区
 @param format self 的日期格式
 @return 返回按照时区转换后的日期 string
 */
- (NSString *)convertToTargetDateStringFromSourceTimeZoneOffset:(NSString *)sourceTzOffSet
										   targetTimeZoneOffset:(NSString *)targetTzOffSet
											   sourceDateFormat:(NSString *)format;
@end
