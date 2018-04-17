//
//  NSString+FormatJudgement.h
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/17.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FormatJudgement)

/**
 判断字符串是否为纯数字
 */
- (BOOL)isAllForTheDigital;

/**
 判断该字符串是否为正确的 IPv4 地址格式
 */
- (BOOL)isValidIPString;

/**
 判断该字符串是否为正确的 JSON 格式
 */
- (BOOL)isValidJSONString;

@end
