//
//  OCHamcrest - HCDescription.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <Foundation/Foundation.h>

@protocol HCSelfDescribing;


/**
    A description of an HCMatcher.
    
    An HCMatcher will describe itself to a description which can later be used for reporting.

    @ingroup core
 */
@protocol HCDescription

/**
    Appends some plain text to the description.
    
    @return @c self, for chaining.
 */
- (id<HCDescription>) appendText:(NSString*)text;

/**
    Appends description of HCSelfDescribing value to @c self.
    
    @return @c self, for chaining.
 */
- (id<HCDescription>) appendDescriptionOf:(id<HCSelfDescribing>)value;

/**
    Appends an arbitary value to the description.
    
    @return @c self, for chaining.
 */
- (id<HCDescription>) appendValue:(id)value;

/** 
    Appends a list of objects to the description.
    
    @return @c self, for chaining.
 */
- (id<HCDescription>) appendList:(NSArray*)values
                           start:(NSString*)start
                       separator:(NSString*)separator
                             end:(NSString*)end;

@end
