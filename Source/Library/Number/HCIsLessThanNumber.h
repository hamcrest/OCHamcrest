//
//  HCIsLessThanNumber.h
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

#import <OCHamcrest/HCBaseMatcher.h>

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanChar(char value);

/**
 lessThanChar(value) -
 Matches if object is equal to @c NSNumber created from a @c char.

 @param value  The @c char value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c char @a value and compares the evaluated`
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanChar instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanChar HC_lessThanChar
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanDouble(double value);

/**
 lessThanDouble(value) -
 Matches if object is equal to @c NSNumber created from a @c double.

 @param value  The @c double value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c double @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanDouble instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanDouble HC_lessThanDouble
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanFloat(float value);

/**
 lessThanFloat(value) -
 Matches if object is equal to @c NSNumber created from a @c float.

 @param value  The @c float value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c float @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanFloat instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanFloat HC_lessThanFloat
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanInt(int value);

/**
 lessThanInt(value) -
 Matches if object is equal to @c NSNumber created from an @c int.

 @param value  The @c int value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c int @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanInt instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanInt HC_lessThanInt
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanLong(long value);

/**
 lessThanLong(value) -
 Matches if object is equal to @c NSNumber created from a @c long.

 @param value  The @c long value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c long @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanLong HC_lessThanLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanLongLong(long long value);

/**
 lessThanLongLong(value) -
 Matches if object is equal to @c NSNumber created from a <code>long long</code>.

 @param value  The <code>long long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a <code>long long</code> @a value and compares
 the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanLongLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanLongLong HC_lessThanLongLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanShort(short value);

/**
 lessThanShort(value) -
 Matches if object is equal to @c NSNumber created from a @c short.

 @param value  The @c short value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c short @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanShort instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanShort HC_lessThanShort
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedChar(unsigned char value);

/**
 lessThanUnsignedChar(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned char</code>.

 @param value  The <code>unsigned char</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned char</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanUnsignedChar instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanUnsignedChar HC_lessThanUnsignedChar
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedInt(unsigned int value);

/**
 lessThanUnsignedInt(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned int</code>.

 @param value  The <code>unsigned int</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned int</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanUnsignedInt instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanUnsignedInt HC_lessThanUnsignedInt
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedLong(unsigned long value);

/**
 lessThanUnsignedLong(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned long</code>.

 @param value  The <code>unsigned long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned long</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanUnsignedLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanUnsignedLong HC_lessThanUnsignedLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedLongLong(unsigned long long value);

/**
 lessThanUnsignedLongLong(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned long long</code>.

 @param value  The <code>unsigned long long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned long long</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanUnsignedLongLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanUnsignedLongLong HC_lessThanUnsignedLongLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedShort(unsigned short value);

/**
 lessThanUnsignedShort(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned short</code>.

 @param value  The <code>unsigned short</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned short</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanUnsignedShort instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanUnsignedShort HC_lessThanUnsignedShort
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanInteger(NSInteger value);

/**
 lessThanInteger(value) -
 Matches if object is equal to @c NSNumber created from an @c NSInteger.

 @param value  The @c NSInteger value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an @c NSInteger @a value and compares the
 evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanInteger instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanInteger HC_lessThanInteger
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanUnsignedInteger(NSUInteger value);

/**
 lessThanUnsignedInteger(value) -
 Matches if object is equal to @c NSNumber created from an @c NSUInteger.

 @param value  The @c NSUInteger value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an @c NSUInteger @a value and compares the
 evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanUnsignedInteger instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanUnsignedInteger HC_lessThanUnsignedInteger
#endif
