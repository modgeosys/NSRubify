//
//  NSRubifyTests.m
//  NSRubifyTests
//
//  Created by Kevin Weller on 5/24/12.
//  Copyright (c) 2012 ASAP iSoft. All rights reserved.
//

#import "AISRubifiedArrayTests.h"
#import "NSArray+AISRubifiedArray.h"


@interface AISRubifiedArrayTests ()
@property (nonatomic,strong) NSArray *array;
@end


@implementation AISRubifiedArrayTests

@synthesize array = _array;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    NSArray *array = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
}

- (void)tearDown
{
    // Tear-down code here.
    self.array = nil;
    
    [super tearDown];
}

- (void)testFirstObject
{
    STAssertEqualObjects(self.array.firstObject, @"one", nil);
}

@end
