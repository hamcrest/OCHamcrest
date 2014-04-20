What is OCHamcrestExtensions?
-----------------------------

[![Build Status](https://travis-ci.org/elliotchance/OCHamcrestExtensions.svg?branch=master)](https://travis-ci.org/elliotchance/OCHamcrestExtensions)

OCHamcrestExtensions is built on top of [OCHamcrest](https://github.com/hamcrest/OCHamcrest). It adds several more features, including:

* Support for exception assertions.
* More matchers.

OCHamcrestExtensions is a drop in _replacement_ but does contain all the source code of the original OCHamcrest project. If you try and link both libraries you will get duplicate symbol errors.

Below is only documentation for the additions, refer to the [OCHamcrest documentation](https://github.com/hamcrest/OCHamcrest#what-is-ochamcrest) for everything else.



How do I add OCHamcrestExtensions to my project?
------------------------------------------------

### CocoaPods

Add the following dependency to your Podfile. Most people will want OCHamcrest in their test targets, and not include any pods from their main targets:

```ruby
target :MyTests, :exclusive => true do
  pod 'OCHamcrestExtensions', '~> 1.0'
end
```

Use the following import:

    #define HC_SHORTHAND
    #import <OCHamcrestExtensions/OCHamcrestExtensions.h>


New matchers
------------

OCHamcrest comes with a library of useful matchers. This list contains only the additions for OCHamcrestExtensions.

* Boolean

  * `assertYes` - convienience method for `assertThatBool(x, equalToBool(YES))`
  * `assertNo` - convienience method for `assertThatBool(x, equalToBool(NO))`
  * `assertTrue` - same as `assertYes`
  * `assertFalse` - same as `assertNo`

* Collection

  * `lacksKey` - match if a key does not exist in a collection
  
* Exception

  * `ignoringReturnValue` - used to wrap expressions of non-`id` return type
  * `willThrow` - assert that a specific NSException is thrown is thrown
  * `willThrowException` - assert that any NSException is thrown
  * `willNotThrowException` - assert that no exception is thrown


Exceptions
----------

Checking if an exception was thrown (or not thrown) works much the same way as general assertions:

```obj-c
assertThat([myObject mightThrowException], willThrowException());
assertThat([myObject mightThrowException], willNotThrowException());
```

Asserting specific names:

```obj-c
assertThat([myObject mightThrowException], willThrow(NSInvalidArgumentException));
```

Dealing with void and other non-`id` related expressions:

```obj-c
assertThat(ignoringReturnValue(1 + 1), willNotThrowException());
```

Using string matchers against the exception reason:

```obj-c
NSException *e = [NSException exceptionWithName:NSInvalidArgumentException
                                         reason:@"For fun."
                                       userInfo:nil];
assertThat(ignoringReturnValue(@throw e), allOf(
    willThrow(NSInvalidArgumentException),
    containsString(@"fun."),
    nil
));
```

You do not have to specify the exception assertion, so the above could be written shorter - however if the expression returned a string containing "fun." and did not throw then this would be a false-positive:

```obj-c
assertThat(ignoringReturnValue(@throw e), containsString(@"fun."));
```

A safer way and easier way to assert the precise exception with message is to use equality since it contains both:

```obj-c
assertThat(ignoringReturnValue(@throw e), equalTo(@"NSInvalidArgumentException: For fun."));
```