//
//  AISRubifiedString.m
//  NSRubify
//
//  Created by Kevin Weller on 8/3/12.
//  Copyright (c) 2012 ASAP iSoft, released under Apache license.
//

#import "AISRubifiedStringTests.h"
#import "NSString+AISRubifiedString.h"


@interface AISRubifiedStringTests ()
@property (nonatomic,strong) NSString *string;
@end


@implementation AISRubifiedStringTests

@synthesize string = _string;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.string = @"This is a test";
}

- (void)tearDown
{
    // Tear-down code here.
    self.string = nil;
    
    [super tearDown];
}

- (void)testStringByReplacingMatchesOfExpression_options_withTemplate_options
{
    NSString *modifiedString;
    
    // Test replacing substrings in the middle of a string.
    modifiedString = [self.string stringByReplacingMatchesOfExpression:@"is"
                                                               options:0
                                                          withTemplate:@"blah"
                                                               options:0];
    STAssertEqualObjects(modifiedString, @"Thblah blah a test", nil);
    
    // Test replacing a substring at the beginning of a string.
    modifiedString = [self.string stringByReplacingMatchesOfExpression:@"This"
                                                               options:0
                                                          withTemplate:@"blah"
                                                               options:0];
    STAssertEqualObjects(modifiedString, @"blah is a test", nil);
    
    // Test replacing a substring at the end of a string.
    modifiedString = [self.string stringByReplacingMatchesOfExpression:@"test"
                                                               options:0
                                                          withTemplate:@"blah"
                                                               options:0];
    STAssertEqualObjects(modifiedString, @"This is a blah", nil);
}

- (void)testStringByReplacingMatchesOfExpression_options_withBlockResults_options
{
    NSString *(^block)(NSString *) = ^(NSString *matchingSubstring)
    {
        return [matchingSubstring uppercaseString];
    };
    NSString *modifiedString;
    
    // Test replacing substrings in the middle of a string.
    modifiedString = [self.string stringByReplacingMatchesOfExpression:@"is"
                                                               options:0
                                                      withBlockResults:block
                                                               options:0];
    STAssertEqualObjects(modifiedString, @"ThIS IS a test", nil);
    // Test replacing a substring at the beginning of a string.
    modifiedString = [self.string stringByReplacingMatchesOfExpression:@"This"
                                                               options:0
                                                      withBlockResults:block
                                                               options:0];
    STAssertEqualObjects(modifiedString, @"THIS is a test", nil);
    // Test replacing a substring at the end of a string.
    modifiedString = [self.string stringByReplacingMatchesOfExpression:@"test"
                                                               options:0
                                                      withBlockResults:block
                                                               options:0];
    STAssertEqualObjects(modifiedString, @"This is a TEST", nil);
}

@end
