//
//  OCHamcrest - HCDescribedAs.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Provides a custom description to another matcher.
    \ingroup core
 */
@interface HCDescribedAs : HCBaseMatcher
{
    NSString* descriptionTemplate;
    id<HCMatcher> matcher;
    NSArray* values;
}

+ (HCDescribedAs*) describedAs:(NSString*)description
                    forMatcher:(id<HCMatcher>)aMatcher
                    overValues:(NSArray*)templateValues;
- (id) initWithDescription:(NSString*)description
                    forMatcher:(id<HCMatcher>)aMatcher
                    overValues:(NSArray*)templateValues;

@end


/**
    Wraps an existing matcher and overrides the description when it fails.

    Optional values following the matcher are substituted for \%0, \%1, etc.
    The last argument must be nil.

    \see HCDescribedAs
    \ingroup core
 */
OBJC_EXPORT id<HCMatcher> HC_describedAs(NSString* description, id<HCMatcher> matcher, ...);

/**
    Shorthand for \ref HC_describedAs, available if HC_SHORTHAND is defined.
    \ingroup core
 */
#ifdef HC_SHORTHAND
    #define describedAs HC_describedAs
#endif
