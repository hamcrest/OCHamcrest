//
//  OCHamcrest - HCNumberAssert.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <Foundation/Foundation.h>

@protocol HCMatcher;


OBJC_EXPORT void HC_assertThatBoolWithLocation(id testCase, BOOL actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that BOOL actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatBool(actual, matcher)  \
    HC_assertThatBoolWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatBool, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatBool HC_assertThatBool
#endif


OBJC_EXPORT void HC_assertThatCharWithLocation(id testCase, char actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that char actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatChar(actual, matcher)  \
    HC_assertThatCharWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatChar, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatChar HC_assertThatChar
#endif


OBJC_EXPORT void HC_assertThatDoubleWithLocation(id testCase, double actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that double actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatDouble(actual, matcher)  \
    HC_assertThatDoubleWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatDouble, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatDouble HC_assertThatDouble
#endif


OBJC_EXPORT void HC_assertThatFloatWithLocation(id testCase, float actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that float actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatFloat(actual, matcher)  \
    HC_assertThatFloatWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatFloat, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatFloat HC_assertThatFloat
#endif


OBJC_EXPORT void HC_assertThatIntWithLocation(id testCase, int actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that int actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatInt(actual, matcher)  \
    HC_assertThatIntWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatInt, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatInt HC_assertThatInt
#endif


OBJC_EXPORT void HC_assertThatLongWithLocation(id testCase, long actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that long actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
*/
#define HC_assertThatLong(actual, matcher)  \
    HC_assertThatLongWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatLong, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatLong HC_assertThatLong
#endif


OBJC_EXPORT void HC_assertThatLongLongWithLocation(id testCase, long long actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that long long actual value, converted to an NSNumber, satisfies
    matcher.

    \ingroup integration
 */
#define HC_assertThatLongLong(actual, matcher)  \
    HC_assertThatLongLongWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatLongLong, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatLongLong HC_assertThatLongLong
#endif


OBJC_EXPORT void HC_assertThatShortWithLocation(id testCase, short actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that short actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatShort(actual, matcher)  \
    HC_assertThatShortWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatShort, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatShort HC_assertThatShort
#endif


OBJC_EXPORT void HC_assertThatUnsignedCharWithLocation(id testCase, unsigned char actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that unsigned char actual value, converted to an NSNumber,
    satisfies matcher.

    \ingroup integration
*/
#define HC_assertThatUnsignedChar(actual, matcher)  \
    HC_assertThatUnsignedCharWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatUnsignedChar, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatUnsignedChar HC_assertThatUnsignedChar
#endif


OBJC_EXPORT void HC_assertThatUnsignedIntWithLocation(id testCase, unsigned int actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that unsigned int actual value, converted to an NSNumber,
    satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatUnsignedInt(actual, matcher)  \
    HC_assertThatUnsignedIntWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatUnsignedInt, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatUnsignedInt HC_assertThatUnsignedInt
#endif


OBJC_EXPORT void HC_assertThatUnsignedLongWithLocation(id testCase, unsigned long actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that unsigned long actual value, converted to an NSNumber,
    satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatUnsignedLong(actual, matcher)  \
    HC_assertThatUnsignedLongWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatUnsignedLong, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatUnsignedLong HC_assertThatUnsignedLong
#endif


OBJC_EXPORT void HC_assertThatUnsignedLongLongWithLocation(id testCase, unsigned long long actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that unsigned long long actual value, converted to an NSNumber,
    satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatUnsignedLongLong(actual, matcher)  \
    HC_assertThatUnsignedLongLongWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatUnsignedLongLong, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatUnsignedLongLong HC_assertThatUnsignedLongLong
#endif


OBJC_EXPORT void HC_assertThatUnsignedShortWithLocation(id testCase, unsigned short actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that unsigned short actual value, converted to an NSNumber,
    satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatUnsignedShort(actual, matcher)  \
    HC_assertThatUnsignedShortWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatUnsignedShort, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatUnsignedShort HC_assertThatUnsignedShort
#endif


OBJC_EXPORT void HC_assertThatIntegerWithLocation(id testCase, NSInteger actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that NSInteger actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatInteger(actual, matcher)  \
    HC_assertThatIntegerWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatInteger, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatInteger HC_assertThatInteger
#endif


OBJC_EXPORT void HC_assertThatUnsignedIntegerWithLocation(id testCase, NSUInteger actual,
        id<HCMatcher> matcher, const char* fileName, int lineNumber);

/**
    OCUnit integration asserting that NSUInteger actual value, converted to an NSNumber, satisfies matcher.

    \ingroup integration
 */
#define HC_assertThatUnsignedInteger(actual, matcher)  \
    HC_assertThatUnsignedIntegerWithLocation(self, actual, matcher, __FILE__, __LINE__)

/**
    Shorthand for \ref HC_assertThatUnsignedInteger, available if HC_SHORTHAND is defined.

    \ingroup integration
 */
#ifdef HC_SHORTHAND
    #define assertThatUnsignedInteger HC_assertThatUnsignedInteger
#endif
