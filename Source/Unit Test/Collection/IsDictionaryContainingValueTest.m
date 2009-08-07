#import "AbstractMatcherTest.h"

#define HC_SHORTHAND
#import <hamcrest/HCIsDictionaryContainingValue.h>
#import <hamcrest/HCIsEqual.h>


@interface IsDictionaryContainingValueTest : AbstractMatcherTest
@end

@implementation IsDictionaryContainingValueTest

- (id<HCMatcher>) createMatcher
{
    return hasValue(@"irrelevant");
}


- (void) testHasReadableDescription
{
    assertDescription(@"dictionary with value \"a\"", hasValue(@"a"));
}


- (void) testDoesNotMatchEmptyDictionary
{
    assertDoesNotMatch(@"Empty dictionary", hasValue(@"Foo"), [NSDictionary dictionary]);
}


- (void) testMatchesSingletonDictionaryContainingValue
{
    NSDictionary* dict = [NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
    
    assertMatches(@"Matches single key", hasValue(equalTo(@"1")), dict);
}


- (void) testMatchesDictionaryContainingValue
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];
    
    assertMatches(@"Matches 1", hasValue(equalTo(@"1")), dict);
    assertMatches(@"Matches 3", hasValue(equalTo(@"3")), dict);
}


- (void) testProvidesConvenientShortcutForMatchingWithIsEqualTo
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];

    assertMatches(@"Matches 3", hasValue(@"3"), dict);
}


- (void) testDoesNotMatchDictionaryMissingValue
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"1", @"a",
                                            @"2", @"b",
                                            @"3", @"c",
                                            nil];
    
    assertDoesNotMatch(@"Dictionary without matching value", hasValue(@"4"), dict);
}


@end
