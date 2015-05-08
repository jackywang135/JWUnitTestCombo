//
//  JWUnitTestCombo.h
//  JWUnitTestCombo
//
//  Created by JackyWang on 5/8/15.
//  Copyright (c) 2015 JackyWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWUnitTestCombo: NSObject
- (void)assertTrue:(BOOL)condition errorMessage:(NSString *)inMessage;
- (void)assertFalse:(BOOL)condition errorMessage:(NSString *)inMessage;
- (void)assertNotNil:(NSObject *)object errorMessage:(NSString *)inMessage;
- (void)assertNil:(NSObject *)object errorMessage:(NSString *)inMessage;
- (void)fail:(NSString *)inMessage;

- (void)assertIntergerValue:(NSObject *)object errorMessage:(NSString *)inMessage;
- (void)assertNSString:(NSObject *)object errorMessage:(NSString *)inMessage;
- (void)assertNSStringNotEmpty:(NSObject *)object errorMessage:(NSString *)inMessage;
- (void)assertNSDictionary:(NSObject *)object errorMessage:(NSString *)inMessage;
- (void)assertNSDictionaryNotEmpty:(NSObject *)object errorMessage:(NSString *)inMessage;
- (void)assertNSArray:(NSObject *)object errorMessage:(NSString *)inMessage;
- (void)assertNSArrayNotEmpty:(NSObject *)object errorMessage:(NSString *)inMessage;

- (NSString *)concludeTests;
- (void)reset;
@end
