//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCIsCollectionContaining.h"

#import "HCAllOf.h"
#import "HCCollect.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"


@interface HCIsCollectionContaining ()
@property (nonatomic, strong, readonly) id <HCMatcher> elementMatcher;
@end

@implementation HCIsCollectionContaining

- (instancetype)initWithMatcher:(id <HCMatcher>)elementMatcher
{
    self = [super init];
    if (self)
        _elementMatcher = elementMatcher;
    return self;
}

- (BOOL)matches:(id)collection describingMismatchTo:(id <HCDescription>)mismatchDescription
{
    if (![collection conformsToProtocol:@protocol(NSFastEnumeration)])
    {
        [[mismatchDescription appendText:@"was non-collection "] appendDescriptionOf:collection];
        return NO;
    }

    if ([collection count] == 0)
    {
        [mismatchDescription appendText:@"was empty"];
        return NO;
    }

    for (id item in collection)
        if ([self.elementMatcher matches:item])
            return YES;

    [mismatchDescription appendText:@"mismatches were: ["];
    BOOL isPastFirst = NO;
    for (id item in collection)
    {
        if (isPastFirst)
            [mismatchDescription appendText:@", "];
        [self.elementMatcher describeMismatchOf:item to:mismatchDescription];
        isPastFirst = YES;
    }
    [mismatchDescription appendText:@"]"];
    return NO;
}

- (void)describeTo:(id <HCDescription>)description
{
    [[description appendText:@"a collection containing "]
                  appendDescriptionOf:self.elementMatcher];
}

@end


id HC_hasItem(id itemMatcher)
{
    HCRequireNonNilObject(itemMatcher);
    return [[HCIsCollectionContaining alloc] initWithMatcher:HCWrapInMatcher(itemMatcher)];
}

id HC_hasItems(id itemMatchers, ...)
{
    va_list args;
    va_start(args, itemMatchers);
    NSArray *matchers = HCCollectWrappedItems(itemMatchers, args, HC_hasItem);
    va_end(args);

    return hc_allOfIn(matchers);
}
