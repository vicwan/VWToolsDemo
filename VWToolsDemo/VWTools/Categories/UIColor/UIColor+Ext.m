//
//  UIColor+Ext.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/5/3.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "UIColor+Ext.h"

@implementation UIColor (Ext)

+ (UIColor *)colorWithHex:(NSInteger)hex {
	return [UIColor colorWithRed:(((hex & 0xFF0000) >> 16))/255.0 green:(((hex & 0xFF00) >> 8))/255.0 blue:((hex & 0xFF))/255.0 alpha:1.0];
}

@end
