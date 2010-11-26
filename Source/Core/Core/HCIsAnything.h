//
//  OCHamcrest - HCIsAnything.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    A matcher that always returns \c YES.
    \ingroup core
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
    This matcher always evaluates to \c YES.
    \see HCIsAnything
    \ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_anything();

/**
    Shorthand for \ref HC_anything, available if HC_SHORTHAND is defined.
 */
#ifdef HC_SHORTHAND
    #define anything HC_anything
#endif


/**
    This matcher always evaluates to <code>YES</code>.
    \param aDescription  A meaningful string used when describing itself.
    \see HCIsAnything
    \ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_anythingWithDescription(NSString* aDescription);

/**
    Shorthand for \ref HC_anythingWithDescription, available if HC_SHORTHAND is defined.
    \ingroup core
 */
#ifdef HC_SHORTHAND
    #define anythingWithDescription HC_anythingWithDescription
#endif
