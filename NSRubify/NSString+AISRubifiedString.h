//
//  NSString+AISRubifiedString.h
//  NSRubify
//
//  Created by Kevin Weller on 8/3/12.
//  Copyright (c) 2012 ASAP iSoft, released under Apache license.
//

#import <Foundation/Foundation.h>

@interface NSString (AISRubifiedString)

// Equivalents to Ruby String.gsub method
- (NSString *)stringByReplacingMatchesOfExpression:(NSString *)regEx
                                           options:(NSRegularExpressionOptions)regExOptions
                                      withTemplate:(NSString *)template
                                           options:(NSMatchingOptions)matchingOptions;
- (NSString *)stringByReplacingMatchesOfExpression:(NSString *)regEx
                                           options:(NSRegularExpressionOptions)regExOptions
                                  withBlockResults:(NSString *(^)(NSString *matchingSubstring))block
                                           options:(NSMatchingOptions)matchingOptions;
@end
