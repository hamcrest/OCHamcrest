//
//  OCHamcrest - HCIsAnything.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    A matcher that always returns @c YES.
 */
@interface HCIsAnything : HCBaseMatcher
{
    NSString* description;
}

+ (HCIsAnything*) isAnything;
+ (HCIsAnything*) isAnythingWithDescription:(NSString*)aDescription;
- (id) init;
- (id) initWithDescription:(NSString*)aDescription;

@end


/**
    This matcher always evaluates to @c YES.
 */
OBJC_EXPORT id<HCMatcher> HC_anything();

/**
    Shorthand for HC_anything, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define anything HC_anything
#endif


/**
    This matcher always evaluates to <code>YES</code>.
    
    @param aDescription A meaningful string used when describing itself.
 */
OBJC_EXPORT id<HCMatcher> HC_anythingWithDescription(NSString* aDescription);

/**
    Shorthand for HC_anythingWithDescription, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define anythingWithDescription HC_anythingWithDescription
#endif
