//
//  OCHamcrest - HCIsEqualIgnoringCase.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Tests if a string is equal to another string, regardless of the case.
 */
@interface HCIsEqualIgnoringCase : HCBaseMatcher
{
    NSString* string;
}

+ (HCIsEqualIgnoringCase*) isEqualIgnoringCase:(NSString*)aString;
- (id) initWithString:(NSString*)aString;

@end


/**
    Tests if a string is equal to another string, regardless of the case.
 */
OBJC_EXPORT id<HCMatcher> HC_equalToIgnoringCase(NSString* aString);

/**
    Shorthand for \ref HC_endsWith, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define equalToIgnoringCase HC_equalToIgnoringCase
#endif
