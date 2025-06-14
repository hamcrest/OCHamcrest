![ochamcrest](http://hamcrest.org/images/logo.jpg)

# OCHamcrest

[![Build Status](https://github.com/hamcrest/OCHamcrest/actions/workflows/build.yml/badge.svg)](https://github.com/hamcrest/OCHamcrest/actions/workflows/build.yml)
[![Coverage Status](https://coveralls.io/repos/hamcrest/OCHamcrest/badge.svg)](https://coveralls.io/r/hamcrest/OCHamcrest)
[![Swift Package Index Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fhamcrest%2FOCHamcrest%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/hamcrest/OCHamcrest)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/OCHamcrest.svg?style=flat)](https://cocoapods.org/pods/OCHamcrest)
[![Bluesky](https://img.shields.io/badge/Bluesky-0285FF?logo=bluesky&logoColor=fff)](https://bsky.app/profile/qualitycoding.org)
[![Mastodon](https://img.shields.io/mastodon/follow/109765011064804734?domain=https%3A%2F%2Fiosdev.space
)](https://iosdev.space/@qcoding)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UC69XtVGLRydpG7o1nkdQs8Q)](https://www.youtube.com/@QualityCoding)

OCHamcrest is an Objective-C module providing:

* a library of "matcher" objects for declaring rules to check whether a given object matches those
  rules.
* a framework for writing your own matchers.

Matchers can be combined to create flexible expressions of intent in tests.
They can also be used for other purposes, such as user input validation.

<!-- toc -->
## Contents

  * [My First OCHamcrest Test](#my-first-ochamcrest-test)
  * [Predefined Matchers](#predefined-matchers)
    * [Object](#object)
    * [Number](#number)
    * [Text](#text)
    * [Logical](#logical)
    * [Collection](#collection)
    * [Decorator](#decorator)
    * [Syntactic Sugar](#syntactic-sugar)
  * [Common Questions](#common-questions)
    * [How Can I Assert on an Asynchronous Call?](#how-can-i-assert-on-an-asynchronous-call)
    * [Can I Add Custom Matchers?](#can-i-add-custom-matchers)
    * [What About Swift?](#what-about-swift)
  * [How Do I Add OCHamcrest to My Project?](#how-do-i-add-ochamcrest-to-my-project)
    * [Swift Package Manager](#swift-package-manager)
    * [CocoaPods](#cocoapods)
    * [Carthage](#carthage)
    * [Prebuilt Framework](#prebuilt-framework)
    * [Build Your Own](#build-your-own)
  * [Author](#author)<!-- endToc -->


## My First OCHamcrest Test

We'll start by writing a very simple Xcode unit test, but instead of using XCTest's
`XCTAssertEqualObjects` function, we'll use OCHamcrest's `assertThat` construct and a predefined
matcher:

```obj-c
@import OCHamcrest;
@import XCTest;

@interface BiscuitTest : XCTestCase
@end

@implementation BiscuitTest

- (void)testEquals
{
    Biscuit* theBiscuit = [[Biscuit alloc] initWithName:@"Ginger"];
    Biscuit* myBiscuit = [[Biscuit alloc] initWithName:@"Ginger"];
    assertThat(theBiscuit, equalTo(myBiscuit));
}

@end
```

The `assertThat` function is a stylized sentence for making a test assertion. In this example, the
subject of the assertion is the object `theBiscuit`, which is the first method parameter. The second
method parameter is a matcher for `Biscuit` objects, here a matcher that checks one object is equal
to another using the `-isEqual:` method. The test passes since the `Biscuit` class defines an
`-isEqual:` method.

OCHamcrest's functions are actually declared with an "HC_" package prefix (such as `HC_assertThat`
and `HC_equalTo`) to avoid name clashes. To make test writing faster and test code more legible,
optional short syntax is provided by default. For example, instead of writing `HC_assertThat`,
simply write `assertThat`.


## Predefined Matchers

OCHamcrest comes with a library of useful matchers:

### Object

  * `conformsTo` - match object that conforms to protocol
  * `equalTo` - match equal object
  * `hasDescription` - match object's `-description`
  * `hasProperty` - match return value of method with given name
  * `instanceOf` - match object type
  * `isA` - match object type precisely, no subclasses
  * `nilValue`, `notNilValue` - match `nil`, or not `nil`
  * `sameInstance` - match same object
  * `throwsException` - match block that throws an exception
  * HCArgumentCaptor - match anything, capturing all values

### Number

  * `closeTo` - match number close to a given value
  * `greaterThan`, `greaterThanOrEqualTo`, `lessThan`,
  `lessThanOrEqualTo` - match numeric ordering
  * `isFalse` - match zero
  * `isTrue` - match non-zero

### Text

  * `containsSubstring` - match part of a string
  * `endsWith` - match the end of a string
  * `equalToIgnoringCase` - match the complete string but ignore case
  * `equalToIgnoringWhitespace` - match the complete string but ignore extra
  whitespace
  * `startsWith` - match the beginning of a string
  * `stringContainsInOrder`, `stringContainsInOrderIn` - match parts of a string, in relative order

### Logical

  * `allOf`, `allOfIn` - "and" together all matchers
  * `anyOf`, `anyOfIn` - "or" together all matchers
  * `anything` - match anything (useful in composite matchers when you don't
  care about a particular value)
  * `isNot` - negate the matcher

### Collection

  * `contains`, `containsIn` - exactly match the entire collection
  * `containsInAnyOrder`, `containsInAnyOrderIn` - match the entire collection, but in any order
  * `containsInRelativeOrder`, `containsInRelativeOrderIn` - match collection containing items in relative order
  * `everyItem` - match if every item in a collection satisfies a given matcher
  * `hasCount` - match number of elements against another matcher
  * `hasCountOf` - match collection with given number of elements
  * `hasEntries` - match dictionary with key-value pairs in a dictionary
  * `hasEntriesIn` - match dictionary with key-value pairs in a list
  * `hasEntry` - match dictionary containing a key-value pair
  * `hasItem` - match if given item appears in the collection
  * `hasItems`, `hasItemsIn` - match if all given items appear in the collection, in any order
  * `hasKey` - match dictionary with a key
  * `hasValue` - match dictionary with a value
  * `isEmpty` - match empty collection
  * `isIn` - match when object is in given collection
  * `onlyContains`, `onlyContainsIn` - match if collection's items appear in given list

### Decorator

  * `describedAs` - give the matcher a custom failure description
  * `is` - decorator to improve readability - see "Syntactic sugar" below

The arguments for many of these matchers accept not just a matching value, but
another matcher, so matchers can be composed for greater flexibility. For
example, `only_contains(endsWith(@"."))` will match any collection where every
item is a string ending with period.

### Syntactic Sugar

OCHamcrest strives to make your tests as readable as possible. For example, the `is` matcher is a
wrapper that doesn't add any extra behavior to the underlying matcher. The following assertions are
all equivalent:

```obj-c
assertThat(theBiscuit, equalTo(myBiscuit));
assertThat(theBiscuit, is(equalTo(myBiscuit)));
assertThat(theBiscuit, is(myBiscuit));
```

The last form is allowed since `is` wraps non-matcher arguments with `equalTo`. Other matchers that
take matchers as arguments provide similar shortcuts, wrapping non-matcher arguments in `equalTo`.


## Common Questions

### How Can I Assert on an Asynchronous Call?

`assertWithTimeout` will keep evaluating an expression until the matcher is satisfied or a timeout
is reached. For example,

```obj-c
assertWithTimeout(5, thatEventually(self.someString), is(@"expected"));
```

This repeatedly checks for this string to evaluate to "expected" before timing out after 5 seconds.
`thatEventually` is a convenience macro to create a block.

### Can I Add Custom Matchers?

OCHamcrest comes bundled with lots of useful matchers, but you'll probably find that you need to
create your own from time to time to fit your testing needs. See the
["Writing Custom Matchers" guide for more information](https://github.com/hamcrest/OCHamcrest/wiki/Writing-Custom-Matchers).

### What About Swift?

Try the [native Swift implementation of Hamcrest](https://github.com/nschum/SwiftHamcrest).


## How Do I Add OCHamcrest to My Project?

The [Examples](https://github.com/hamcrest/OCHamcrest/tree/main/Examples) folder shows projects
ready to use OCHamcrest via Swift Package Manager, CocoaPods, or through the prebuilt framework.

### Swift Package Manager

Include an OCHamcrest package in your Package.swift manifest's array of `dependencies`:

<!-- snippet: swiftpm-declare-dependencies -->
<a id='snippet-swiftpm-declare-dependencies'></a>
```swift
dependencies: [
    .package(
        url: "https://github.com/hamcrest/OCHamcrest",
        .upToNextMajor(from: "9.1.0")
    ),
],
```
<sup><a href='/Examples/MacExample-SwiftPackageManager/Package.swift#L13-L20' title='Snippet source file'>snippet source</a> | <a href='#snippet-swiftpm-declare-dependencies' title='Start of snippet'>anchor</a></sup>
<!-- endSnippet -->

Then add OCHamcrest to the dependencies of your `.testTarget`:

<!-- snippet: swiftpm-use-dependencies -->
<a id='snippet-swiftpm-use-dependencies'></a>
```swift
.testTarget(
    name: "ExampleTests",
    dependencies: [
        "Example",
        "OCHamcrest",
    ]
),
```
<sup><a href='/Examples/MacExample-SwiftPackageManager/Package.swift#L27-L35' title='Snippet source file'>snippet source</a> | <a href='#snippet-swiftpm-use-dependencies' title='Start of snippet'>anchor</a></sup>
<!-- endSnippet -->

### CocoaPods

If you want to add OCHamcrest using Cocoapods then add the following dependency to your Podfile.
Most people will want OCHamcrest in their test targets, and not include any pods from their main
targets:

```ruby
target 'MyTests' do
  inherit! :search_paths
  use_frameworks!
  pod 'OCHamcrest', '~> 9.1'
end
```

### Carthage

Add the following to your Cartfile:

    github "hamcrest/OCHamcrest" ~> 9.1

Then drag the the built framework from the appropriate Carthage/Build directory into your project,
but with "Copy items into destination group's folder" disabled.

### Prebuilt Framework

A prebuilt binary is available on [GitHub](https://github.com/hamcrest/OCHamcrest/releases/). The
binary is packaged as OCHamcrest.xcframework, containing these architectures:
  * macOS
  * Mac Catalyst
  * iOS device
  * iOS simulator
  * tvOS device
  * tvOS simulator
  * visionOS device
  * visionOS simulator
  * watchOS device
  * watchOS simulator

Drag the XCFramework into your project.

### Build Your Own

If you want to build OCHamcrest yourself, clone the repo, then

```sh
$ cd Resources
$ ./MakeDistribution.sh
```

## Author

Jon Reid is the author of _[iOS Unit Testing by Example](https://iosunittestingbyexample.com)._ His website is [Quality Coding](https://qualitycoding.org).
