//
//  VWTimeZoneConversionSpec.m
//  VWToolsDemoTests
//
//  Created by 万伟琦 on 2018/4/18.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSString+TimeZone.h"
#import <Kiwi.h>

SPEC_BEGIN(VWTimeZoneConversionSpec)

/*
 时间转换方法 UT
 1. 通过时区 code 转换；
 2. 通过时区偏移量转换；
 */
describe(@"A time string", ^{
	__block NSString *timeFormat;
	
	beforeAll(^{
		timeFormat = @"yyyy-MM-dd HH:mm:ss";		//时间格式
	});
	
	// 通过时区 code 进行时间转换
	context(@"can be correctly converted by timezone code", ^{
		__block	NSString *timeStr_Winter;
		__block	NSString *timeStr_Summer;
		
		__block NSTimeZone *China;			//🇨🇳中国
		__block NSTimeZone *Los_Angeles;	//🇺🇸洛杉矶
		__block NSTimeZone *Sydney;			//🇦🇺悉尼
		__block NSTimeZone *London;			//🇬🇧伦敦
		
		beforeEach(^{
			timeStr_Winter = @"2018-01-01 18:00:00";	//北半球冬令时, 南半球夏令时
			timeStr_Summer = @"2018-06-01 18:00:00";    //南半球冬令时, 北半球夏令时
			
			China = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
			Los_Angeles = [NSTimeZone timeZoneWithName:@"America/Los_Angeles"];
			Sydney = [NSTimeZone timeZoneWithName:@"Australia/Sydney"];
			London = [NSTimeZone timeZoneWithName:@"Europe/London"];
		});
		afterEach(^{
			timeStr_Winter = nil;
			timeStr_Summer = nil;
			China = nil;
			Los_Angeles = nil;
			Sydney = nil;
			London = nil;
		});
		
		it(@"from not DST to not DST", ^{
			NSString *result = [timeStr_Winter convertToTargetDateStringFromSourceTimeZoneName:China.name targetTimeZoneName:Los_Angeles.name sourceDateFormat:timeFormat];
			[[result should] equal:@"2018-01-01 02:00:00"];
		});
		
		it(@"from not DST to DST", ^{
			NSString *result = [timeStr_Summer convertToTargetDateStringFromSourceTimeZoneName:China.name targetTimeZoneName:Los_Angeles.name sourceDateFormat:timeFormat];
			[[result should] equal:@"2018-06-01 03:00:00"];
		});
		
		it(@"from DST to not DST", ^{
			NSString *result = [timeStr_Summer convertToTargetDateStringFromSourceTimeZoneName:Los_Angeles.name targetTimeZoneName:China.name sourceDateFormat:timeFormat];
			[[result should] equal:@"2018-06-02 09:00:00"];
		});
		
		it(@"from DST to DST", ^{
			NSString *result = [timeStr_Summer convertToTargetDateStringFromSourceTimeZoneName:Los_Angeles.name targetTimeZoneName:London.name sourceDateFormat:timeFormat];
			[[result should] equal:@"2018-06-02 02:00:00"];
		});
	});
	
	// 通过时区偏移量进行时间转换
	context(@"can be correctly converted by time offset", ^{
		__block NSString *time;
		
		__block NSString *offset_8plus;		//+8
		__block NSString *offset_6_5plus;	//+6.5
		__block NSString *offset_4_5minus;	//-4.5
		__block NSString *offset_13minus;	//-13
		
		beforeEach(^{
			time = @"2018-01-01 18:00:00";
			
			offset_8plus = @"+8";
			offset_6_5plus = @"+6.5";
			offset_4_5minus = @"-4.5";
			offset_13minus = @"-13";
		});
		afterEach(^{
			time = nil;
			offset_8plus = nil;
			offset_6_5plus = nil;
			offset_4_5minus = nil;
			offset_13minus = nil;
		});
		// + -> +
		it(@"from east to east", ^{
			NSString *result = [time convertToTargetDateStringFromSourceTimeZoneOffset:offset_8plus targetTimeZoneOffset:offset_6_5plus sourceDateFormat:timeFormat];
			[[result should] equal:@"2018-01-01 16:30:00"];
		});
		
		// + -> -
		it(@"from east to west", ^{
			NSString *result = [time convertToTargetDateStringFromSourceTimeZoneOffset:offset_8plus targetTimeZoneOffset:offset_13minus sourceDateFormat:timeFormat];
			[[result should] equal:@"2017-12-31 21:00:00"];
		});
		
		// - -> +
		it(@"from west to east", ^{
			NSString *result = [time convertToTargetDateStringFromSourceTimeZoneOffset:offset_13minus targetTimeZoneOffset:offset_8plus sourceDateFormat:timeFormat];
			[[result should] equal:@"2018-01-02 15:00:00"];
		});
		
		// - -> -
		it(@"from west to west", ^{
			NSString *result = [time convertToTargetDateStringFromSourceTimeZoneOffset:offset_13minus targetTimeZoneOffset:offset_4_5minus sourceDateFormat:timeFormat];
			[[result should] equal:@"2018-01-02 02:30:00"];
		});
	});
});


SPEC_END
