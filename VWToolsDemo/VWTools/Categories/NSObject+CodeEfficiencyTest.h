//
//  NSObject+CodeEfficiencyTest.h
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/5/21.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TestBlock)(int idx);

@interface NSObject (CodeEfficiencyTest)

/**
 This method is used for testing the average time cost of a piece of codes.
 
 @param cycles 'Cycles' means how many rounds you want to test with. For example, if you want to test a piece of codes for 10000 times, and you want to test this for loop twice, then the cycles will be 2 and you will get the average time cost of the two tests.
 @param times The times of the testing block will be executed per cycle.
 @param block Codes to test. The block has a 'idx' parameter, which stands for the index of traverse in the for loop.
 @return The average of time spent in terms of cycles.
 */
- (CFAbsoluteTime)averageTimeCostWithCycles:(int)cycles
				 testingBlockExecutionTimes:(int)times
							   testingBlock:(TestBlock)block;

/**
 This method is used for testing the average time cost of a piece of codes for 1 round.
 */
- (CFAbsoluteTime)timeCostWithTestingBlockExecutionTimes:(int)times
											testingBlock:(TestBlock)block;

@end
