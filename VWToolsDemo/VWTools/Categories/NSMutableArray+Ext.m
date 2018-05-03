//
//  NSMutableArray+Ext.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/23.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSMutableArray+Ext.h"

@implementation NSMutableArray (Ext)

- (void)appendObjects:(id)firstObject, ... {
	id eachObject;
	va_list argumentList;
	if (firstObject) // The first argument isn't part of the varargs list,
	{                                   // so we'll handle it separately.
		[self addObject: firstObject];
		va_start(argumentList, firstObject); // Start scanning for arguments after firstObject.
		while ((eachObject = va_arg(argumentList, id))) // As many times as we can get an argument of type "id"
			[self addObject: eachObject]; // that isn't nil, add it to self's contents.
		va_end(argumentList);
	}
}

@end
