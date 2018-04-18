//
//  VWStringJudgementTests.m
//  VWToolsDemoTests
//
//  Created by 万伟琦 on 2018/4/18.
//  Copyright © 2018年 万伟琦. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+FormatJudgement.h"

#define VALID_JSON_STRING @"[{\"CityId\":18,\"CityName\":\"西安\",\"ProvinceId\":27,\"CityOrder\":1},{\"CityId\":53,\"CityName\":\"广州\",\"ProvinceId\":27,\"CityOrder\":1}]"

#define INVALID_JSON_STRING @"[{\"CityId\":18,\"CityName\":\"西安\",\"ProvinceId\":27,\"CityOrder\":1},{\"CityId\":53,\"CityName\":\"广州\",\"ProvinceId\":27,\"CityOrder\":1},,]"

#define VALID_IP_STRING @"113.14.14.14";

@interface VWStringJudgementTests : XCTestCase

@property (nonatomic, copy) NSString *testString;

@end

@implementation VWStringJudgementTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - DIGIT JUDGEMENT
/************** DIGIT JUDGEMENT *************/
- (void)testAStringWhichIsAllForDigitalShouldBeJudgedAsSuccess {
	self.testString = @"21312321434";
	BOOL isAllDigit = NO;
	isAllDigit = [self.testString isAllForTheDigital];
	XCTAssertTrue(isAllDigit, @"The string is all for the digital, which should have returned YES");
}

- (void)testAStringWhichIsNotAllForDigitalShouldBeJudgedAsFailure1 {
	self.testString = @"1231abc123";
	BOOL isAllDigit = YES;
	isAllDigit = [self.testString isAllForTheDigital];
	XCTAssertFalse(isAllDigit, @"The string is not all digits because it contains alphabets");
}

- (void)testAStringWhichIsNotAllForDigitalShouldBeJudgedAsFailure2 {
	self.testString = @"1231\\.123";
	BOOL isAllDigit = YES;
	isAllDigit = [self.testString isAllForTheDigital];
	XCTAssertFalse(isAllDigit, @"The string is not all digits because it contains other symbols");
}

#pragma mark - JSON JUDGEMENT
/************** JSON JUDGEMENT *************/
- (void)testValidJSONJudgement {
	self.testString = VALID_JSON_STRING;
	BOOL isJson = NO;
	isJson = [self.testString isValidJSONString];
	XCTAssertTrue(isJson, @"The isJSON judgement result returned NO, which should have returned YES.");
}

- (void)testInvalidJSONJudgement {
	self.testString = INVALID_JSON_STRING;
	BOOL isJson = YES;
	isJson = [self.testString isValidJSONString];
	XCTAssertFalse(isJson, @"The isJSON judgement result returned YES, which should have returned NO.");
}


#pragma mark - IP JUDGEMENT
/************** IP JUDGEMENT *************/
- (void)testValidIPJudgement {
	self.testString = VALID_IP_STRING;
	BOOL isIP = NO;
	isIP = [self.testString isValidIPString];
	XCTAssertTrue(isIP, @"The IP judgement result returned NO, which should have returned YES.");
}

- (void)testInvalidIPJudgement1 {
	self.testString = @"123.123.123.123.123";
	BOOL isIP = YES;
	isIP = [self.testString isValidIPString];
	XCTAssertFalse(isIP, @"The IP string should be separated as 4 parts by dot.");
}

- (void)testInvalidIPJudgement2 {
	self.testString = @"123,123.123.123";
	BOOL isIP = YES;
	isIP = [self.testString isValidIPString];
	XCTAssertFalse(isIP, @"The IP string contains illegal symbol, result should have returned NO.");
}

- (void)testInvalidIPJudgement3 {
	self.testString = @"123,2.123.123.123";
	BOOL isIP = YES;
	isIP = [self.testString isValidIPString];
	XCTAssertFalse(isIP, @"The IP string contains illegal symbol, result should have returned NO.");
}

- (void)testInvalidIPJudgement4 {
	self.testString = @"12xx.123.123.123";
	BOOL isIP = YES;
	isIP = [self.testString isValidIPString];
	XCTAssertFalse(isIP, @"The IP string contains illegal symbol, result should have returned NO");
}

- (void)testInvalidIPJudgement5 {
	self.testString = @"123.244.256.256";
	BOOL isIP = YES;
	isIP = [self.testString isValidIPString];
	XCTAssertFalse(isIP, @"Every part of IP string should be integer and in the range of [0, 255], result should have returned NO");
}

@end
