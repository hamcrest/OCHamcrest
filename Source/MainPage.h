//
//  OCHamcrest - MainPage.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//


/**
    @mainpage OCHamcrest

    @section contents Contents:
    @li @ref whatisit
    @li @ref addtoproject
    @li @ref firsttest
    @li @ref predefined
    @li @ref sugar
    @li @ref custom
    @li @ref resources


    @section whatisit What is OCHamcrest?

    OCHamcrest is:
    @li a library of "matcher" objects that let you declare rules for whether a given object matches
        the criteria or not.
    @li a framework for writing your own matchers.

    Matchers are useful for a variety of purposes, such as UI validation. But they're most commonly
    used for writing unit tests that are expressive and flexible.

    OCHamcrest is used for both Mac and iOS development with:
    @li OCUnit (SenTestingKit) built in to Xcode
    @li Google Toolbox for Mac (GTM)
    @li GHUnit
    @li Cedar BDD framework
    @li OCMock
    @li OCHandMock
    @li OCMockito


    @section addtoproject How do I add OCHamcrest to my project?

    Rather than build OCHamcrest yourself, I recommend you use the pre-built release available in
    Downloads. This works for projects using Automatic Reference Counting (ARC) as well as for
    projects using traditional memory management.

    (But if you still want to build OCHamcrest yourself, go into the Source folder and execute
    @c MakeDistribution.sh from Terminal.)

    The steps vary slightly depending on whether your project is a Mac project or an iOS project:

    @b Mac:
    @li Add @b OCHamcrest.framework to your project.
    @li Add a Copy Files build phase to copy OCHamcrest.framework to your Products Directory. For
        unit test bundles, make sure this Copy Files phase comes before the Run Script phase that
        executes tests.
    @li Add @code
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
    @endcode

	Note: If your Console shows @code
otest[57510:203] *** NSTask: Task create for path '...' failed: 22, "Invalid argument".  Terminating temporary process.
	@endcode
	double-check your Copy Files phase.

    @b iOS:
    @li Add @b OCHamcrestIOS.framework to your project.
    @li Add \e "-lstdc++" and \e "-ObjC" to your "Other Linker Flags".
    @li Add @code
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>
    @endcode


    @section firsttest My first OCHamcrest test

    We'll start by writing a very simple Xcode unit test, but instead of using OCUnit's
    @c STAssertEqualObjects function, we'll use OCHamcrest's @c assertThat construct and a
    predefined matcher:

    @code
#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

@interface BiscuitTest : SenTestCase
@end

@implementation BiscuitTest

- (void)testEquals
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


    @section predefined Predefined matchers

    OCHamcrest comes with a library of useful matchers:

    <ul>
    <li>Object</li>
        <ul>
        <li>@ref equalTo - match equal object</li>
        <li>@ref hasDescription - match object's @c -description</li>
		<li>@ref hasProperty - match return value of method with given name</li>
        <li>@ref instanceOf - match object type</li>
        <li>@ref conformsToProtocol - match object protocol conformance</li>
        <li>@ref nilValue, @ref notNilValue - match for @c nil, or not @c nil</li>
        <li>@ref sameInstance - match same object</li>
        </ul>
    <li>Number</li>
        <ul>
        <li>@ref closeTo - match number close to a given value</li>
        <li>@b equalTo&lt;TypeName&gt; - match number equal to a primitive number (such as @ref equalToInt for an @c int)</li>
        <li>@ref greaterThan, @ref greaterThanOrEqualTo, @ref lessThan, @ref lessThanOrEqualTo - match numeric ordering</li>
        </ul>
    <li>Text</li>
        <ul>
        <li>@ref containsString - match part of a string</li>
        <li>@ref endsWith - match the end of a string</li>
        <li>@ref equalToIgnoringCase - match the complete string but ignore case</li>
        <li>@ref equalToIgnoringWhitespace - match the complete string but ignore extra whitespace</li>
        <li>@ref startsWith - match the beginning of a string</li>
        <li>@ref stringContainsInOrder - match parts of a string, in relative order</li>
        </ul>
    <li>Logical</li>
        <ul>
        <li>@ref allOf - "and" together all matchers</li>
        <li>@ref anyOf - "or" together all matchers</li>
        <li>@ref anything - match anything, useful in composite matchers when you don't care about a particular value</li>
        <li>@ref isNot - negate the matcher</li>
        </ul>
    <li>Collection</li>
        <ul>
        <li>@ref contains - exactly match the entire collection</li>
        <li>@ref containsInAnyOrder - match the entire collection, but in any order</li>
        <li>@ref empty - match empty collection</li>
        <li>@ref hasCount - match number of elements against another matcher</li>
        <li>@ref hasCountOf - match collection with given number of elements</li>
        <li>@ref hasEntries - match dictionary with list of key-value pairs</li>
        <li>@ref hasEntry - match dictionary containing a key-value pair</li>
        <li>@ref hasItem - match if given item appears in the collection</li>
        <li>@ref hasItems - match if all given items appears in the collection, in any order</li>
        <li>@ref hasKey - match dictionary with a key</li>
        <li>@ref hasValue - match dictionary with a value</li>
        <li>@ref onlyContains -  match if collections's items appear in given list</li>
        </ul>
    <li>Decorator</li>
        <ul>
        <li>@ref describedAs - give the matcher a custom failure description</li>
        <li>@ref is - decorator to improve readability - see @ref sugar, below</li>
        </ul>
    </ul>

    The arguments for many of these matchers accept not just a matching value, but another matcher,
    so matchers can be composed for greater flexibility. For example,
    <tt>only_contains(endsWith(\@"."))</tt> will match any collection where every item is a string
    ending with period.


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


    @section resources More resources

    @li <a href="http://jonreid.github.com/OCHamcrest/">OCHamcrest documentation</a>
    @li <a href="https://github.com/jonreid/OCHamcrest">Latest OCHamcrest sources</a>
    @li <a href="http://code.google.com/p/hamcrest/">Official Hamcrest website
    @li <a href="http://pypi.python.org/pypi/PyHamcrest">PyHamcrest</a> - Python version.
    @li <a href="http://qualitycoding.org/">Quality Coding</a> - Tools, tips &amp; techniques for
        <em>building quality in</em> to iOS development.

 */
