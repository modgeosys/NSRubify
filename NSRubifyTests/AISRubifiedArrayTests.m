//
//  NSRubifyTests.m
//  NSRubifyTests
//
//  Created by Kevin Weller on 5/24/12.
//  Copyright (c) 2012 ASAP iSoft, released under Apache license.
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
    self.array = @[@"one", @"two", @"three"];
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

- (void)testMappedArrayUsingBlocks
{
    NSArray *expectedArray = @[@3U, @3U, @5U];
    NSArray *computedArray = [self.array mappedArrayUsingBlock:^(id obj)
                              {
                                  return (@(((NSString *) obj).length));
                              }
                             ];
    STAssertEqualObjects(computedArray, expectedArray, nil);
}

@end
