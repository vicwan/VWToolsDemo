//
//  NSString+FormatJudgement.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/17.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSString+FormatJudgement.h"

@implementation NSString (FormatJudgement)

- (BOOL)isAllForTheDigital {
	NSScanner *scanner = [NSScanner scannerWithString:self];
	int val;
	return ([scanner scanInt:&val] && [scanner isAtEnd]);

//	另一种方式
//	NSString *s = [str stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
//	if (s.length > 0) {
//		return NO;
//	}
//	return YES;
}

- (BOOL)isValidIPString {
	NSArray<NSString *> *components = [self componentsSeparatedByString:@"."];
	if (components.count != 4) {
//		NSLog(@"IP 地址以 . 分隔必须有 4 段!");
		return NO;
	}
	NSString *strWithoutDot = [self stringByReplacingOccurrencesOfString:@"."
															withString:@""];
	if (![strWithoutDot isAllForTheDigital]) {
//		NSLog(@"IP 地址必须为数字!");
		return NO;
	}
	for (__block NSString *component in components) {
		NSInteger part = [component integerValue];
		if (part < 0 || part > 255) {
//			NSLog(@"IP 地址每段必须在 0 - 255 之间!");
			return NO;
		}
	}
	NSLog(@"IP地址正确!");
	return YES;
}

- (BOOL)isValidJSONString{
	BOOL isJson = NO;
	NSError *error = nil;
	if (self) {
		NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
		[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
		isJson = !error;
	}
	return isJson;
}

@end
