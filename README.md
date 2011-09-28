* [Full documentation](http://jonreid.github.com/OCHamcrest/)
* [Latest sources](https://github.com/jonreid/OCHamcrest)
* [Hamcrest information](http://code.google.com/p/hamcrest/)

See also:

* [PyHamcrest](http://pypi.python.org/pypi/PyHamcrest) - Python version.
* [Quality Coding](http://jonreid.blogs.com/qualitycoding/) - Tools, tips and
techniques for _building quality in_ to your iOS programs.


Introduction
============

OCHamcrest is a framework for writing matcher objects, allowing you to
declaratively define "match" rules. There are a number of situations where
matchers are invaluable, such as UI validation, or data filtering, but it is in
the area of writing flexible tests that matchers are most commonly used. This
tutorial shows you how to use OCHamcrest for unit testing.

When writing tests it is sometimes difficult to get the balance right between
overspecifying the test (and making it brittle to changes), and not specifying
enough (making the test less valuable since it continues to pass even when the
thing being tested is broken). Having a tool that allows you to pick out
precisely the aspect under test and describe the values it should have, to a
controlled level of precision, helps greatly in writing tests that are "just
right." Such tests fail when the behavior of the aspect under test deviates from
the expected behavior, yet continue to pass when minor, unrelated changes to the
behavior are made.


Cocoa and iOS
=============

OCHamcrest is supported for both Cocoa and iOS development.

__Cocoa:__

Add OCHamcrest.framework to your project.

Add a Copy Files build phase to copy OCHamcrest.framework to your Products
Directory. For unit test bundles, make sure this Copy Files phase comes before
the Run Script phase that executes tests.

Add:

    #define HC_SHORTHAND
    #import <OCHamcrest/OCHamcrest.h>


__iOS:__

Add OCHamcrestIOS.framework to your project.

Add "-lstdc++" and "-ObjC" to your "Other Linker Flags".

Add:

    #define HC_SHORTHAND
    #import <OCHamcrestIOS/OCHamcrestIOS.h>


My first OCHamcrest test
========================

We'll start by writing a very simple Xcode unit test, but instead of using
OCUnit's ``STAssertEqualObjects`` function, we'll use OCHamcrest's
``assertThat`` construct and a predefined matcher:

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

The ``assertThat`` function is a stylized sentence for making a test assertion.
In this example, the subject of the assertion is the object ``theBiscuit``,
which is the first method parameter. The second method parameter is a matcher
for ``Biscuit`` objects, here a matcher that checks one object is equal to
another using the ``-isEqual:`` method. The test passes since the ``Biscuit``
class defines an ``-isEqual:`` method.

OCHamcrest's functions are actually declared with an "HC" package prefix (such
as ``HC_assertThat`` and ``HC_equalTo``) to avoid name clashes. To make test
writing faster and test code more legible, shorthand macros are provided if
``HC_SHORTHAND`` is defined before including the OCHamcrest header. For example,
instead of writing ``HC_assertThat``, simply write ``assertThat``.


Predefined matchers
===================

OCHamcrest comes with a library of useful matchers:

* Object

  * ``equalTo`` - match equal object
  * ``hasDescription`` - match object's ``-description``
  * ``hasProperty`` - match return value of method with given name
  * ``instanceOf`` - match object type
  * ``nilValue``, ``notNilValue`` - match @c nil, or not @nil
  * ``sameInstance`` - match same object

* Number

  * ``closeTo`` - match number close to a given value
  * equalTo<TypeName> - match number equal to a primitive number (such as
  ``equalToInt`` for an ``int``)
  * ``greaterThan``, ``greaterThanOrEqualTo``, ``lessThan``,
  ``lessThanOrEqualTo`` - match numeric ordering

* Text

  * ``containsString`` - match part of a string
  * ``endsWith`` - match the end of a string
  * ``equalToIgnoringCase`` - match the complete string but ignore case
  * ``equalToIgnoringWhitespace`` - match the complete string but ignore
  extra whitespace
  * ``startsWith`` - match the beginning of a string
  * ``stringContainsInOrder`` - match parts of a string, in relative order

* Logical

  * ``allOf`` - "and" together all matchers
  * ``anyOf`` - "or" together all matchers
  * ``anything`` - match anything, useful in composite matchers when you don't
  care about a particular value
  * ``isNot`` - negate the matcher

* Collection

  * ``contains`` - exactly match the entire collection
  * ``containsInAnyOrder`` - match the entire collection, but in any order
  * ``empty`` - match empty collection
  * ``hasCount`` - match number of elements against another matcher
  * ``hasCountOf`` - match collection with given number of elements
  * ``hasEntries`` - match dictionary with list of key-value pairs
  * ``hasEntry`` - match dictionary containing a key-value pair
  * ``hasKey`` - match dictionary with a key
  * ``hasValue`` - match dictionary with a value
  * ``hasItem`` - match if given item appears in the collection
  * ``hasItems`` - match if all given items appear in the collection, in any order
  * ``onlyContains`` - match if collections's items appear in given list

* Decorator

  * ``describedAs`` - give the matcher a custom failure description
  * ``is`` - decorator to improve readability - see `Syntactic sugar` below

The arguments for many of these matchers accept not just a matching value, but
another matcher, so matchers can be composed for greater flexibility. For
example, ``only_contains(endsWith(@"."))`` will match any collection where
every item is a string ending with period.


Syntactic sugar
===============

OCHamcrest strives to make your tests as readable as possible. For example, the
``is`` matcher is a wrapper that doesn't add any extra behavior to the
underlying matcher. The following assertions are all equivalent:

    assertThat(theBiscuit, equalTo(myBiscuit));
    assertThat(theBiscuit, is(equalTo(myBiscuit)));
    assertThat(theBiscuit, is(myBiscuit));

The last form is allowed since ``is`` wraps non-matcher arguments with
``equalTo``. Other matchers that take matchers as arguments provide similar
shortcuts, wrapping non-matcher arguments in ``equalTo``.


Writing custom matchers
=======================

OCHamcrest comes bundled with lots of useful matchers, but you'll probably find
that you need to create your own from time to time to fit your testing needs.
This commonly occurs when you find a fragment of code that tests the same set of
properties over and over again (and in different tests), and you want to bundle
the fragment into a single assertion. By writing your own matcher you'll
eliminate code duplication and make your tests more readable!

Let's write our own matcher for testing if a calendar date falls on a Saturday.
This is the test we want to write:

    - (void) testDateIsOnASaturday
    {
        NSCalendarDate* date = [NSCalendarDate dateWithString:@"26 Apr 2008" calendarFormat:@"%d %b %Y"];
        assertThat(date, is(onASaturday()))
    }

Here's the interface:

    #import <OCHamcrest/HCBaseMatcher.h>
    #import <objc/objc-api.h>

    @interface IsGivenDayOfWeek : HCBaseMatcher
    {
        NSInteger day;      // 0 indicates Sunday
    }

    + (id) isGivenDayOfWeek:(NSInteger)dayOfWeek;
    - (id) initWithDay:(NSInteger)dayOfWeek;

    @end

    OBJC_EXPORT id<HCMatcher> onASaturday();

The interface consists of two parts: a class definition, and a factory function
(with C binding). Here's what the implementation looks like:

    #import "IsGivenDayOfWeek.h"
    #import <OCHamcrest/HCDescription.h>

    @implementation IsGivenDayOfWeek

    + (id) isGivenDayOfWeek:(NSInteger)dayOfWeek
    {
        return [[[self alloc] initWithDay:dayOfWeek] autorelease];
    }

    - (id) initWithDay:(NSInteger)dayOfWeek
    {
        self = [super init];
        if (self != nil)
            day = dayOfWeek;
        return self;
    }

    // Test whether item matches.
    - (BOOL) matches:(id)item
    {
        if (![item respondsToSelector:@selector(dayOfWeek)])
            return NO;

        return [item dayOfWeek] == day;
    }

    // Describe the matcher.
    - (void) describeTo:(id<HCDescription>)description
    {
        NSString* dayAsString[] =
            {@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"};
        [[description appendText:@"calendar date falling on "] appendText:dayAsString[day]];
    }

    @end


    id<HCMatcher> onASaturday()
    {
        return [IsGivenDayOfWeek isGivenDayOfWeek:6];
    }

For our Matcher implementation we implement the ``-matches:`` method -- which
calls the ``-dayOfWeek`` method after confirming that the argument has such a
method -- and the ``-describe_to:`` method -- which is used to produce a failure
message when a test fails. Here's an example of how the failure message looks:

    NSCalendarDate* date = [NSCalendarDate dateWithString: @"6 April 2008" calendarFormat: @"%d %B %Y"];
    assertThat(date, is(onASaturday()));

fails with the message

    Expected: is calendar date falling on Saturday, got: <06 April 2008>

and Xcode shows it as a build error. Double clicking the error message takes you
to the assertion that failed.

Even though the ``onASaturday`` function creates a new matcher each time it is
called, you should not assume this is the only usage pattern for your matcher.
Therefore you should make sure your matcher is stateless, so a single instance
can be reused between matches.
