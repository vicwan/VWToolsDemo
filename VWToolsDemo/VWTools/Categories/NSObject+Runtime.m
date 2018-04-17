//
//  NSObject+Runtime.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/17.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)

- (void)setAllPropertiesWithInitialValue:(NSString *)initialValue {
	unsigned int count = 0;
	// 获取所有成员变量
	Ivar *ivars = class_copyIvarList([self class], &count);
	
	// 遍历所有成员变量
	for (int i = 0; i < count; i++) {
		// 逐个获取成员变量
		Ivar ivar = *(ivars + i);
		// 获取成员变量名
		const char *ivarName = ivar_getName(ivar);
		// 将成员变量名转换为 NSString 对象
		NSString *key = [NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
		// KVC 根据 key 设置成员 value
		[self setValue:initialValue forKey:key];
	}
	free(ivars);
}

@end
