//
//  NSString+TimeRemainDescription.h
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/7/4.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TimeRemainDescription)

+ (NSTimeInterval)timeIntervalWithUTCString:(NSString *)dateString;

+ (NSString *)timeRemainDescriptionWithUTCString:(NSString *)dateString;

+ (NSString *)timeRemainDescriptionWithDateSP:(NSNumber *)dateSP;

@end

NS_ASSUME_NONNULL_END
