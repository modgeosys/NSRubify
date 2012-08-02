//
//  NSArray+AISRubifiedArray.h
//  NSRubify
//
//  Created by Kevin Weller on 5/24/12.
//  Copyright (c) 2012 ASAP iSoft, released under Apache license.
//

#import <Foundation/Foundation.h>


@interface NSArray (AISRubifiedArray)

- (id)firstObject;                                          // Complementary to Objective-C Foundation NSArray.lastObject method
- (NSArray *)mappedArrayUsingBlock:(id(^)(id obj))block;    // Equivalent to Ruby Array.map/collect method

@end
