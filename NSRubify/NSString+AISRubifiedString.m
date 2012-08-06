//
//  NSString+AISRubifiedString.m
//  NSRubify
//
//  Created by Kevin Weller on 8/3/12.
//  Copyright (c) 2012 ASAP iSoft, released under Apache license.
//

#import "NSString+AISRubifiedString.h"


@implementation NSString (AISRubifiedString)

// Equivalent to Ruby String.gsub method with string template
- (NSString *)stringByReplacingMatchesOfExpression:(NSString *)regEx
                                           options:(NSRegularExpressionOptions)regExOptions
                                      withTemplate:(NSString *)template
                                           options:(NSMatchingOptions)matchingOptions
{
    NSMutableString *workingString = [NSMutableString stringWithString:self];
    NSRegularExpression *regExObject = [NSRegularExpression regularExpressionWithPattern:regEx
                                                                                 options:regExOptions
                                                                                   error:NULL];
    [regExObject replaceMatchesInString:workingString
                                options:matchingOptions
                                  range:NSMakeRange(0, workingString.length)
                           withTemplate:template];
    return [NSString stringWithString:workingString];
}

// Equivalent to Ruby String.gsub method with block template
- (NSString *)stringByReplacingMatchesOfExpression:(NSString *)regEx
                                           options:(NSRegularExpressionOptions)regExOptions
                                  withBlockResults:(NSString *(^)(NSString *))block
                                           options:(NSMatchingOptions)matchingOptions
{
    NSMutableString *workingString = [NSMutableString stringWithString:@""];
    NSRegularExpression *regExObject = [NSRegularExpression regularExpressionWithPattern:regEx
                                                                                 options:regExOptions
                                                                                   error:NULL];
    // Enumerate over each match, appending the pre-match text, then the block results for the match.
    __block NSUInteger lastMatchLoccation = 0;
    [regExObject enumerateMatchesInString:self
                                  options:matchingOptions
                                    range:NSMakeRange(0, self.length)
                               usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop)
        {
            NSRange matchRange = result.range;
            NSRange prefixRange = NSMakeRange(lastMatchLoccation, matchRange.location - lastMatchLoccation);
            [workingString appendFormat:@"%@%@", [self substringWithRange:prefixRange], block([self substringWithRange:matchRange])];
            lastMatchLoccation += (prefixRange.length + matchRange.length);
        }
    ];
    // Append any final non-matching text.
    [workingString appendString:[self substringWithRange:NSMakeRange(lastMatchLoccation, self.length - lastMatchLoccation)]];
    return workingString;
}

@end
