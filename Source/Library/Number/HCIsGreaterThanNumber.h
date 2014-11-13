//
//  HCIsGreaterThanNumber.h
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

#import <OCHamcrest/HCBaseMatcher.h>

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanChar(char value);

/**
 greaterThanChar(value) -
 Matches if object is equal to @c NSNumber created from a @c char.

 @param value  The @c char value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c char @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanChar instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanChar HC_greaterThanChar
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanDouble(double value);

/**
 greaterThanDouble(value) -
 Matches if object is equal to @c NSNumber created from a @c double.

 @param value  The @c double value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c double @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanDouble instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanDouble HC_greaterThanDouble
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanFloat(float value);

/**
 greaterThanFloat(value) -
 Matches if object is equal to @c NSNumber created from a @c float.

 @param value  The @c float value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c float @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanFloat instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanFloat HC_greaterThanFloat
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanInt(int value);

/**
 greaterThanInt(value) -
 Matches if object is equal to @c NSNumber created from an @c int.

 @param value  The @c int value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c int @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanInt instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanInt HC_greaterThanInt
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanLong(long value);

/**
 greaterThanLong(value) -
 Matches if object is equal to @c NSNumber created from a @c long.

 @param value  The @c long value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c long @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanLong HC_greaterThanLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanLongLong(long long value);

/**
 greaterThanLongLong(value) -
 Matches if object is equal to @c NSNumber created from a <code>long long</code>.

 @param value  The <code>long long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a <code>long long</code> @a value and compares
 the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanLongLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanLongLong HC_greaterThanLongLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanShort(short value);

/**
 greaterThanShort(value) -
 Matches if object is equal to @c NSNumber created from a @c short.

 @param value  The @c short value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c short @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanShort instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanShort HC_greaterThanShort
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedChar(unsigned char value);

/**
 greaterThanUnsignedChar(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned char</code>.

 @param value  The <code>unsigned char</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned char</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanUnsignedChar instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanUnsignedChar HC_greaterThanUnsignedChar
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedInt(unsigned int value);

/**
 greaterThanUnsignedInt(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned int</code>.

 @param value  The <code>unsigned int</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned int</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanUnsignedInt instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanUnsignedInt HC_greaterThanUnsignedInt
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedLong(unsigned long value);

/**
 greaterThanUnsignedLong(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned long</code>.

 @param value  The <code>unsigned long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned long</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanUnsignedLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanUnsignedLong HC_greaterThanUnsignedLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedLongLong(unsigned long long value);

/**
 greaterThanUnsignedLongLong(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned long long</code>.

 @param value  The <code>unsigned long long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned long long</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanUnsignedLongLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanUnsignedLongLong HC_greaterThanUnsignedLongLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedShort(unsigned short value);

/**
 greaterThanUnsignedShort(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned short</code>.

 @param value  The <code>unsigned short</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned short</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanUnsignedShort instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanUnsignedShort HC_greaterThanUnsignedShort
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanInteger(NSInteger value);

/**
 greaterThanInteger(value) -
 Matches if object is equal to @c NSNumber created from an @c NSInteger.

 @param value  The @c NSInteger value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an @c NSInteger @a value and compares the
 evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanInteger instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanInteger HC_greaterThanInteger
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanUnsignedInteger(NSUInteger value);

/**
 greaterThanUnsignedInteger(value) -
 Matches if object is equal to @c NSNumber created from an @c NSUInteger.

 @param value  The @c NSUInteger value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an @c NSUInteger @a value and compares the
 evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanUnsignedInteger instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanUnsignedInteger HC_greaterThanUnsignedInteger
#endif
