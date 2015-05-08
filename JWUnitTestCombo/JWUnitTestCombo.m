//
//  JWUnitTestCombo.m
//  JWUnitTestCombo
//
//  Created by JackyWang on 5/8/15.
//  Copyright (c) 2015 JackyWang. All rights reserved.
//

#import "JWUnitTestCombo.h"
@interface JWUnitTestCombo()
@property(strong, nonatomic)NSMutableString *errorMessage;
@property(assign, nonatomic)int errorCount;
@end

@implementation JWUnitTestCombo
- (instancetype)init
{
	if (self) {
		self = [super init];
		[self reset];
	}
	return self;
}

- (void)assertTrue:(BOOL)condition errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if (!condition) {
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}
- (void)assertFalse:(BOOL)condition errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if (condition) {
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}

- (void)assertNotNil:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if (!object) {
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}
- (void)assertNil:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if (object) {
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}

- (void)assertNSString:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if (![object isKindOfClass:[NSString class]]) {
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}
- (void)assertNSStringNotEmpty:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if ([object isKindOfClass:[NSString class]]) {
		if ([(NSString *)object length]) {
			return;
		}
	}
	[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
	errorCount++;
}

- (void)assertNSArray:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if (![object isKindOfClass:[NSArray class]]) {
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}
- (void)assertNSArrayNotEmpty:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if ([object isKindOfClass:[NSArray class]]) {
		if ([(NSArray *)object count]) {
			return;
		}
	}
	[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
	errorCount++;
}

- (void)assertNSDictionary:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if (![object isKindOfClass:[NSDictionary class]]) {
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}
- (void)assertNSDictionaryNotEmpty:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if ([object isKindOfClass:[NSDictionary class]]) {
		if ([[(NSDictionary *)object allKeys] count]) {
			return;
		}
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}

- (void)assertIntergerValue:(NSObject *)object errorMessage:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	if (![object respondsToSelector:@selector(integerValue)]) {
		[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
		errorCount++;
	}
}

- (void)fail:(NSString *)inMessage
{
	NSAssert(inMessage && [inMessage length], @"Test must have errorMessage");
	[errorMessage appendString:[NSString stringWithFormat:@" %@, ", inMessage]];
	errorCount++;
}

- (NSString *)concludeTests
{
	return (errorCount) ? [NSString stringWithFormat:@"%i errors with reasons:%@", errorCount, errorMessage ] : nil;
}

- (void)reset
{
	errorMessage = [[NSMutableString alloc]initWithString:@""];
	errorCount = 0;
}

@synthesize errorCount, errorMessage;
@end
