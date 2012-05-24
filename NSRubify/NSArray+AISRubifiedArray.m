//
//  NSArray+AISRubifiedArray.m
//  NSRubify
//
//  Created by Kevin Weller on 5/24/12.
//  Copyright (c) 2012 ASAP iSoft, released under Apache license.
//

#import "NSArray+AISRubifiedArray.h"


@implementation NSArray (AISRubifiedArray)

- (id)firstObject
{
    id result = nil;
    if (self.count > 0)
    {
        result = [self objectAtIndex:0];
    }
    return result;
}

@end
