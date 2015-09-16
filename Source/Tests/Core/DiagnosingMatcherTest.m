//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCDiagnosingMatcher.h>

#import "AbstractMatcherTest.h"


@interface IncompleteDiagnosingMatcher : HCDiagnosingMatcher
@end

@implementation IncompleteDiagnosingMatcher

// Let's say we mistakenly implemented -matches: instead of -matches:describingMismatchTo:
- (BOOL)matches:(id)item
{
    return YES;
}

@end


@interface IncompleteDiagnosingMatcherTest : AbstractMatcherTest
@end

@implementation IncompleteDiagnosingMatcherTest

- (void)testSubclassShouldBeRequiredToDefineMatchesDescribingMismatchToMethod
{
    id matcher = [[IncompleteDiagnosingMatcher alloc] init];

    XCTAssertThrows([matcher matches:nil describingMismatchTo:nil]);
}

@end
