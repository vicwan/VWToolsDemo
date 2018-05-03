//
//  ViewController.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/17.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Ext.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
//	NSDate *date = [NSDate date];
//	NSString *str = [self dateToBeiJingString:date withFormat:@"yyyy-MM-dd HH:mm:ss"];
//	NSDate *d = [self dateBeiJingFromString:str withFormat:@"yyyy-MM-dd HH:mm:ss"];
//	NSLog(@"...");
	[self showUndeterminedParams];
//	self.view.backgroundColor = [UIColor colorWithHex:0xFF1234];
	self.view.backgroundColor = UIColorFromHex(0xFF1234);
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (NSString *)dateToBeiJingString:(NSDate *)date withFormat:(NSString *)format
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:format];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Hong_Kong"]];
	NSString *strDate = [dateFormatter stringFromDate:date];
	return strDate;
}

- (NSDate *)dateBeiJingFromString:(NSString *)string withFormat:(NSString *)format
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/New_York"]];
	[dateFormatter setDateFormat:format];
	return [dateFormatter dateFromString: string];
}



- (void)showUndeterminedParams {
	NSString *str = @"dada";
	NSString *str1 = @"mam";
	[self doLog1:@"123 %@", str, str1];
//	[self doLog2:@"123 %@", str];
	NSMutableArray *arr = [NSMutableArray arrayWithObjects: nil];

}


- (void)doLog1:(NSString *)formatStr, ... {
	
	if (!formatStr) return;
	
	va_list arglist;
	va_start(arglist, formatStr);
	NSString *outStr = [[NSString alloc] initWithFormat:formatStr arguments:arglist];
	va_end(arglist);
	NSLog(@"%@", outStr);
}

- (void)doLog2:(NSString *)formatStr, ... {
	
	if (!formatStr) return;
	
	va_list arglist;
	va_start(arglist, formatStr);
	id arg;
	while(( arg = va_arg(arglist, id) )) {
		if (arg)
			NSLog(@"%@", arg);
	}
	va_end(arglist);
}

- (void)doLog3:(NSString *)formatStr, ... {
	
	if (!formatStr) return;
	
	va_list arglist;
	va_start(arglist, formatStr);
	id arg;
	while(( arg = va_arg(arglist, id) )) {
		if (arg)
			NSLog(@"%@", arg);
	}
	va_end(arglist);
}



@end
