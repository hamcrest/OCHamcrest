//
//  OCHamcrest - MainPage.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//


/**
    @mainpage OCHamcrest

    @section contents Contents:
    @li @ref intro
    @li @ref platforms
    @li @ref firsttest
    @li @ref tour
    @li @ref sugar
    @li @ref custom


    @section intro Introduction

    OCHamcrest is an Objective-C framework for writing matcher objects, allowing you to
    declaratively define "match" rules. There are a number of situations where matchers are
    invaluable, such as UI validation or data filtering, but it is in the area of writing flexible
    tests that matchers are most commonly used. This tutorial shows you how to use OCHamcrest for
    unit testing.

    When writing tests it is sometimes difficult to get the balance right between overspecifying the
    test (and making it brittle to changes), and not specifying enough (making the test less
    valuable since it continues to pass even when the thing being tested is broken). Having a tool
    that allows you to pick out precisely the aspect under test and describe the values it should
    have, to a controlled level of precision, helps greatly in writing tests that are "just right."
    Such tests fail when the behavior of the aspect under test deviates from the expected behavior,
    yet continue to pass when minor, unrelated changes to the behavior are made.


    @section platforms Cocoa and iOS

    OCHamcrest is supported for both Cocoa and iOS development.

    @b Cocoa:
    @li Add @b OCHamcrest.framework to your project.
    @li Add a Copy Files build phase to copy OCHamcrest.framework to your Products Directory. For
        unit test bundles, make sure this Copy Files phase comes before the Run Script phase that
        executes tests.
    @li Add @code
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
    @endcode

    @b iOS:
    @li Add @b OCHamcrestIOS.framework to your project.
    @li Add \e "-lstdc++" and \e "-ObjC" to your "Other Linker Flags".
    @li Add @code
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>
    @endcode


    @section firsttest My first OCHamcrest test

    We'll start by writing a very simple Xcode unit test, but instead of using OCUnit's
    @c STAssertEqualObjects function, we'll use OCHamcrest's @c assertThat construct and the
    standard set of matchers.

    @code
#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

@interface BiscuitTest : SenTestCase
@end

@implementation BiscuitTest

- (void) testEquals
{
    Biscuit* theBiscuit = [Biscuit biscuitNamed:@"Ginger"];
    Biscuit* myBiscuit = [Biscuit biscuitNamed:@"Ginger"];
    assertThat(theBiscuit, equalTo(myBiscuit));
}

@end
    @endcode

    The @ref assertThat function is a stylized sentence for making a test assertion. In this
    example, the subject of the assertion is the object @c theBiscuit, which is the first method
    parameter. The second method parameter is a matcher for @c Biscuit objects, here a matcher that
    checks one object is equal to another using the @c -isEqual: method. The test passes since the
    @c Biscuit class defines an @c -isEqual: method.

    OCHamcrest's functions are actually declared with an "HC" package prefix (such as
    @c HC_assertThat and @c HC_equalTo) to avoid name clashes. To make test writing faster and test
    code more legible, shorthand macros are provided if @c HC_SHORTHAND is defined before including
    the OCHamcrest header. For example, instead of writing @ref HC_assertThat, simply write
    @ref assertThat.


    @section tour A tour of common matchers

    OCHamcrest comes with a library of useful matchers. Here are some of the most important ones.

    <ul>
    <li>Core</li>
        <ul>
        <li>@ref anything - always matches, useful if you don't care what the object under test is</li>
        <li>@ref describedAs - decorator to add custom failure description</li>
        <li>@ref is - decorator to improve readability - see @ref sugar, below</li>
        </ul>
    <li>Logical</li>
        <ul>
        <li>@ref allOf - matches if all matchers match, short circuits (like C's &&)</li>
        <li>@ref anyOf - matches if any matchers match, short circuits (like C's ||)</li>
        <li>@ref isNot - matches if the wrapped matcher doesn't match and vice versa</li>
        </ul>
    <li>Object</li>
        <ul>
        <li>@ref equalTo - tests object equality using @c -isEqual:</li>
        <li>@ref hasDescription - tests whether @c -description satisfies a given matcher</li>
        <li>@ref instanceOf - tests type</li>
        <li>@ref notNilValue, @ref nilValue - tests for nil</li>
        <li>@ref sameInstance - tests object identity</li>
        </ul>
    <li>Collections</li>
        <ul>
        <li>@ref hasEntry, @ref hasKey, @ref hasValue - tests that an NSDictionary contains an entry, key
            or value</li>
        <li>@ref hasItem, @ref hasItems - tests that a collection contains elements</li>
        </ul>
    <li>Number</li>
        <ul>
        <li>@ref closeTo - tests that floating point values are close to a given value</li>
        <li>@ref greaterThan, @ref greaterThanOrEqualTo, @ref lessThan, @ref lessThanOrEqualTo -
            tests ordering</li>
        </ul>
    <li>Text</li>
        <ul>
        <li>@ref equalToIgnoringCase - tests string equality ignoring case</li>
        <li>@ref equalToIgnoringWhiteSpace - tests string equality ignoring differences in runs of whitespace</li>
        <li>@ref containsString, @ref endsWith, @ref startsWith - tests string matching</li>
        </ul>
    </ul>


    @section sugar Syntactic sugar

    OCHamcrest strives to make your tests as readable as possible. For example, the @ref is matcher
    is a wrapper that doesn't add any extra behavior to the underlying matcher. The following
    assertions are all equivalent:

    @code
assertThat(theBiscuit, equalTo(myBiscuit));
assertThat(theBiscuit, is(equalTo(myBiscuit)));
assertThat(theBiscuit, is(myBiscuit));
    @endcode


    @section custom Writing custom matchers

    A key feature of OCHamcrest is its extensibility. See @ref custom-matchers for an example of how
    to write your own matchers.

 */
