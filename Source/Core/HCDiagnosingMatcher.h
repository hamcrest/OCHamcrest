//
//  OCHamcrest - HCDiagnosingMatcher.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import <OCHamcrest/HCBaseMatcher.h>


/**
 Base class for matchers that generate mismatch descriptions during the matching.

 Some matching algorithms have several "no match" paths. It helps to make the mismatch description
 as precise as possible, but we don't want to have to repeat the matching logic to do so. For such
 matchers, subclass HCDiagnosingMatcher and implement <code>-matches:describingMismatchTo:</code>.

 @ingroup core
*/
@interface HCDiagnosingMatcher : HCBaseMatcher
@end
