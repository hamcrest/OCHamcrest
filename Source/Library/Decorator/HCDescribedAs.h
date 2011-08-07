//
//  OCHamcrest - HCDescribedAs.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


/**
    Provides a custom description to another matcher.

    @b Factory: @ref describedAs
    @ingroup decorator_matchers
 */
@interface HCDescribedAs : HCBaseMatcher
{
    NSString *descriptionTemplate;
    id<HCMatcher> matcher;
    NSArray *values;
}

+ (id)describedAs:(NSString *)description
       forMatcher:(id<HCMatcher>)aMatcher
       overValues:(NSArray *)templateValues;

- (id)initWithDescription:(NSString *)description
               forMatcher:(id<HCMatcher>)aMatcher
               overValues:(NSArray *)templateValues;

@end


#pragma mark -

/**
    Wraps an existing matcher and overrides the description when it fails.

    Optional values following the matcher are substituted for \%0, \%1, etc., in the description.
    The last argument must be nil.

    @b Synonym: @ref describedAs
    @see HCDescribedAs
    @ingroup decorator_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_describedAs(NSString *description, id<HCMatcher> matcher, ...);

/**
    Wraps an existing matcher and overrides the description when it fails.

    Optional values following the matcher are substituted for \%0, \%1, etc., in the description.
    The last argument must be nil.

    Synonym for @ref HC_describedAs, available if @c HC_SHORTHAND is defined.
    @see HCDescribedAs
    @ingroup decorator_matchers
 */
#ifdef HC_SHORTHAND
    #define describedAs(description, matcher, ...)  HC_describedAs(description, matcher, ##__VA_ARGS__)
#endif
