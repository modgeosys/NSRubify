//
//  NSArray+AISRubifiedArray.m
//  NSRubify
//
//  Created by Kevin Weller on 5/24/12.
//  Copyright (c) 2012 ASAP iSoft, released under Apache license.
//

#import "NSArray+AISRubifiedArray.h"


@implementation NSArray (AISRubifiedArray)

// Complementary to Objective-C Foundation NSArray.lastObject method
- (id)firstObject
{
    id object = nil;
    if (self.count > 0)
    {
        object = self[0];
    }
    return object;
}

// Equivalent to Ruby Array.map/collect method
- (NSArray *)mappedArrayUsingBlock:(id(^)(id obj))block
{
    NSMutableArray *newArray = [NSMutableArray array];
    for (id element in self)
    {
        id newElement = block(element);
        [newArray addObject:newElement];
    }
    return [NSArray arrayWithArray:newArray];
}

@end
