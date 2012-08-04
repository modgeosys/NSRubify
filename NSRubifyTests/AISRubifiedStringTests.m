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
    NSString *modifiedString = [self.string stringByReplacingMatchesOfExpression:@"is"
                                                                         options:0
                                                                    withTemplate:@"blah"
                                                                         options:0];
    STAssertEqualObjects(modifiedString, @"Thblah blah a test", nil);
}

- (void)testStringByReplacingMatchesOfExpression_options_withBlockResults_options
{
    NSString *modifiedString = [self.string stringByReplacingMatchesOfExpression:@"is"
                                                                         options:0
                                                                withBlockResults:^NSString *(NSString *matchingSubstring)
                                                                {
                                                                    return [matchingSubstring uppercaseString];
                                                                }
                                                                         options:0];
    STAssertEqualObjects(modifiedString, @"ThIS IS a test", nil);
}

@end
