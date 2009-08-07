#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCIsCollectionContaining.h>
#import <hamcrest/HCIsEqual.h>


@interface IsCollectionContainingTest : AbstractMatcherTest
@end

@implementation IsCollectionContainingTest

- (id<HCMatcher>) createMatcher
{
    return hasItem(equalTo(@"irrelevant"));
}


- (void) testMatchesACollectionThatContainsAnElementMatchingTheGivenMatcher
{
    id<HCMatcher> itemMatcher = hasItem(equalTo(@"a"));
    
    assertMatches(@"should match list that contains 'a'",
                itemMatcher, ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
}


- (void) testDoesNotMatchCollectionThatDoesntContainAnElementMatchingTheGivenMatcher
{
    id <HCMatcher> itemMatcher = hasItem(equalTo(@"a"));
    
    assertDoesNotMatch(@"should not match list that doesn't contain 'a'",
                itemMatcher, ([NSArray arrayWithObjects:@"b", @"c", nil]));    
    assertDoesNotMatch(@"should not match the empty list",
                itemMatcher, [NSArray array]);
}


- (void) testDoesNotMatchNil
{
    assertDoesNotMatch(@"should not match nil", hasItem(equalTo(@"a")), nil);
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    assertMatches(@"should match container that contains 'a'",
                hasItem(@"a"), ([NSSet setWithObjects:@"a", @"b", @"c", nil]));
    assertDoesNotMatch(@"should not match container that doesn't contain 'a'",
                hasItem(@"a"), ([NSSet setWithObjects:@"b", @"c", nil]));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"a collection containing \"a\"", hasItem(equalTo(@"a")));
}


- (void) testMatchesAllItemsInCollection
{
    id<HCMatcher> matcher1 = hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil);
    assertMatches(@"should match list containing all items",
                matcher1,
                ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
    
    id<HCMatcher> matcher2 = hasItems(@"a", @"b", @"c", nil);
    assertMatches(@"should match list containing all items (without matchers)",
                matcher2,
                ([NSArray arrayWithObjects:@"a", @"b", @"c", nil]));
    
    id<HCMatcher> matcher3 = hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil);
    assertMatches(@"should match list containing all items in any order",
                matcher3,
                ([NSArray arrayWithObjects:@"c", @"b", @"a", nil]));
    
    id<HCMatcher> matcher4 = hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil);
    assertMatches(@"should match list containing all items plus others",
                matcher4,
                ([NSArray arrayWithObjects:@"e", @"c", @"b", @"a", @"d", nil]));
    
    id<HCMatcher> matcher5 = hasItems(equalTo(@"a"), equalTo(@"b"), equalTo(@"c"), nil);
    assertDoesNotMatch(@"should not match list unless it contains all items",
                matcher5,
                ([NSArray arrayWithObjects:@"e", @"c", @"b", @"d", nil]));  // "a" missing
}


- (void) testDoesNotMatchObjectWithoutEnumerator
{
    assertDoesNotMatch(@"should not match object without enumerator",
                hasItem(@"a"), [[[NSObject alloc] init] autorelease]);
}

@end
