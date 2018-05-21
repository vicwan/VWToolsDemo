//
//  NSObject+CodeEfficiencyTest.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/5/21.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSObject+CodeEfficiencyTest.h"

@implementation NSObject (CodeEfficiencyTest)

- (CFAbsoluteTime)averageTimeCostWithCycles:(int)cycles
				 testingBlockExecutionTimes:(int)times
							   testingBlock:(TestBlock)block {
	if (times <= 0 || cycles <= 0) {
		return 0;
	}
	if (!block) {
		return 0;
	}
	
	NSMutableArray *results = [NSMutableArray array];
	
	for (int r = 0; r < cycles; r++) {
		CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
		for (int i = 0; i < times; i++) {
			@autoreleasepool {
				block(i);
			}
		}
		CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
		CFAbsoluteTime duration = end - start;
		NSNumber *result = [NSNumber numberWithFloat:duration];
		[results addObject:result];
	}
	
	CFAbsoluteTime avg = [[results valueForKeyPath:@"@avg.floatValue"] floatValue];
	return avg;
}

- (CFAbsoluteTime)timeCostWithTestingBlockExecutionTimes:(int)times
											testingBlock:(TestBlock)block {
	return [self averageTimeCostWithCycles:1 testingBlockExecutionTimes:times testingBlock:block];
}


@end
