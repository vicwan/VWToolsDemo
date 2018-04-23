//
//  NSString+Encrypt.m
//  VWToolsDemo
//
//  Created by 万伟琦 on 2018/4/23.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import "NSString+Encrypt.h"

@implementation NSString (Encrypt)

- (NSString *)md5 {
	const char *cString = [self UTF8String];
	unsigned char digest[CC_MD5_DIGEST_LENGTH];
	CC_MD5(cString, (unsigned int)strlen(cString), digest);
	return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			digest[0], digest[1], digest[2], digest[3],
			digest[4], digest[5], digest[6], digest[7],
			digest[8], digest[9], digest[10], digest[11],
			digest[12], digest[13], digest[14], digest[15]
			];
}

@end
