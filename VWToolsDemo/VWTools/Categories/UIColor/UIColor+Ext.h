//
//  UIColor+Ext.h
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/5/3.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import <UIKit/UIKit.h>

// 16进制颜色
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >> 8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0]
// rgb 颜色
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface UIColor (Ext)

/**
 使用 16 进制颜色

 @param hex 16进制
 @return UIColor instance
 */
+ (UIColor *)colorWithHex:(NSInteger)hex;

@end
