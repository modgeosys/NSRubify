//
//  NSRubifyTests.m
//  NSRubifyTests
//
//  Created by Kevin Weller on 5/24/12.
//  Copyright (c) 2012 ASAP iSoft. All rights reserved.
//

#import "AISRubifiedArrayTests.h"
#import "NSArray+AISRubifiedArray.h"


@implementation AISRubifiedArrayTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testFirstObject
{
    NSArray *array = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
    STAssertEqualObjects(array.firstObject, @"one", nil);
}

@end
