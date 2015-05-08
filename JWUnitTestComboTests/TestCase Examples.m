//
//  TestCase Examples.m
//  JWUnitTestCombo
//
//  Created by JackyWang on 5/8/15.
//  Copyright (c) 2015 JackyWang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JWUnitTestCombo.h"

@interface TestCaseExamples : XCTestCase
@property(strong, nonatomic)JWUnitTestCombo *combo;
@end

@implementation TestCaseExamples
- (void)setUp {
	[super setUp];
	if (!self.combo) {
		self.combo = [[JWUnitTestCombo alloc] init];
	}
}
- (void)tearDown {
	[super tearDown];
	[self.combo reset];
}
- (void)testOldWay {
	//Variables to be tested
	BOOL testFalse = NO;
	NSObject *testObject = nil;
	NSNumber *testInt = [NSNumber numberWithInt:1];
	NSArray *testArray = [NSArray array];
	NSDictionary *testDictionary = [NSDictionary dictionary];
	NSString *testString = [NSString string];
	
	//test cases
	XCTAssertTrue(testFalse, @"testFalse is false");
	XCTAssertNotNil(testObject, @"testNull is null");
	XCTAssertTrue([testInt respondsToSelector:@selector(integerValue)], @"testInt is not an integer");
	XCTAssertTrue([testArray isKindOfClass:[NSArray class]], @"testArray is not NSArray");
	XCTAssertTrue([testArray count], @"testArray is empty");
	XCTAssertTrue([testDictionary isKindOfClass:[NSDictionary class]], @"testDictionary is not NSDictionary");
	XCTAssertTrue([testDictionary.allKeys count], @"testDictionary is empty");
	XCTAssertTrue([testString isKindOfClass:[NSString class]], @"testString is not NSString");
	XCTAssertTrue([testString length], @"testString is empty");
}
- (void)testNewWay {
	//Variables to be tested
	BOOL testFalse = NO;
	NSObject *testObject = nil;
	NSNumber *testInt = [NSNumber numberWithInt:1];
	NSArray *testArray = [NSArray array];
	NSDictionary *testDictionary = [NSDictionary dictionary];
	NSString *testString = [NSString string];
	
	//test cases
	[combo assertTrue:testFalse errorMessage:@"testFalse is false"];
	[combo assertNotNil:testObject errorMessage:@"testNull is null"];
	[combo assertIntergerValue:testInt errorMessage:@"testInt is not an integer"];
	[combo assertNSArray:testArray errorMessage:@"testArray is not NSArray"];
	[combo assertNSArrayNotEmpty:testArray errorMessage:@"testArray is empty"];
	[combo assertNSDictionary:testDictionary errorMessage:@"testDictionary is not NSDictionary"];
	[combo assertNSDictionaryNotEmpty:testDictionary errorMessage:@"testDictionary is empty"];
	[combo assertNSString:testString errorMessage:@"testString is not NSString"];
	[combo assertNSStringNotEmpty:testString errorMessage:@"testString is empty"];
	
	//All tests are combined into one output
	NSString *error = [self.combo concludeTests];
	if (error) {
		XCTFail(@"%@", error);
	}
}
@synthesize combo;
@end
