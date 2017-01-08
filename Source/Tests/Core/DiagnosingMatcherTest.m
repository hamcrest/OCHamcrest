//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>

#import "MatcherTestCase.h"


@interface IncompleteDiagnosingMatcher : HCDiagnosingMatcher
@end

@implementation IncompleteDiagnosingMatcher

// Let's say we mistakenly implemented -matches: instead of -matches:describingMismatchTo:
- (BOOL)matches:(nullable id)item
{
    return YES;
}

@end


@interface IncompleteDiagnosingMatcherTest : MatcherTestCase
@end

@implementation IncompleteDiagnosingMatcherTest

- (void)testSubclassShouldBeRequiredToDefineMatchesDescribingMismatchToMethod
{
    id matcher = [[IncompleteDiagnosingMatcher alloc] init];

    XCTAssertThrows([matcher matches:nil describingMismatchTo:nil]);
}

@end
