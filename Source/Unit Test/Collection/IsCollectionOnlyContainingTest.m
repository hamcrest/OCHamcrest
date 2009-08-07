#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCIsCollectionOnlyContaining.h>
#import <hamcrest/HCIsEqual.h>


@interface IsCollectionOnlyContainingTest : AbstractMatcherTest
@end

@implementation IsCollectionOnlyContainingTest

- (id<HCMatcher>) createMatcher
{
    return onlyContains(equalTo(@"irrelevant"), nil);
}


- (void) testDoesNotMatchEmptyCollection
{
    id collection = [NSArray array];
    assertDoesNotMatch(@"empty collection", onlyContains(equalTo(@"foo"), nil), collection);
}


- (void) testMatchesSingletonCollection
{
    id collection = [NSSet setWithObject:@"a"];
    assertMatches(@"singleton collection", onlyContains(equalTo(@"a"), nil), collection);
}


- (void) testMatchesCollection
{
    id collection = [NSSet setWithObjects:@"a", @"b", nil];
    assertMatches(@"collection", onlyContains(equalTo(@"a"), equalTo(@"b"), nil), collection);
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    id collection = [NSSet setWithObjects:@"a", @"b", nil];
    assertMatches(@"collection", onlyContains(@"a", equalTo(@"b"), nil), collection);
}


- (void) testDoesNotMatchCollectionWithMismatchingItem
{
    id collection = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    assertDoesNotMatch(@"collection", onlyContains(@"a", @"b", nil), collection);
}


- (void) testHasAReadableDescription
{
    assertDescription(@"a collection containing items matching (\"a\" or \"b\")",
                        onlyContains(@"a", @"b", nil));

}

@end
