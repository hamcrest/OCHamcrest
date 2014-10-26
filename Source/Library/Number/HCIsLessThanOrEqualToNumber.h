//
//  HCIsLessThanOrEqualToNumber.h
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

#import <OCHamcrest/HCBaseMatcher.h>

FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToChar(char value);

/**
 lessThanOrEqualToChar(value) -
 Matches if object is equal to @c NSNumber created from a @c char.

 @param value  The @c char value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c char @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToChar instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToChar HC_lessThanOrEqualToChar
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToDouble(double value);

/**
 lessThanOrEqualToDouble(value) -
 Matches if object is equal to @c NSNumber created from a @c double.

 @param value  The @c double value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c double @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToDouble instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToDouble HC_lessThanOrEqualToDouble
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToFloat(float value);

/**
 lessThanOrEqualToFloat(value) -
 Matches if object is equal to @c NSNumber created from a @c float.

 @param value  The @c float value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c float @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToFloat instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToFloat HC_lessThanOrEqualToFloat
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToInt(int value);

/**
 lessThanOrEqualToInt(value) -
 Matches if object is equal to @c NSNumber created from an @c int.

 @param value  The @c int value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c int @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToInt instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToInt HC_lessThanOrEqualToInt
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToLong(long value);

/**
 lessThanOrEqualToLong(value) -
 Matches if object is equal to @c NSNumber created from a @c long.

 @param value  The @c long value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c long @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToLong HC_lessThanOrEqualToLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToLongLong(long long value);

/**
 lessThanOrEqualToLongLong(value) -
 Matches if object is equal to @c NSNumber created from a <code>long long</code>.

 @param value  The <code>long long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a <code>long long</code> @a value and compares
 the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToLongLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToLongLong HC_lessThanOrEqualToLongLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToShort(short value);

/**
 lessThanOrEqualToShort(value) -
 Matches if object is equal to @c NSNumber created from a @c short.

 @param value  The @c short value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c short @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToShort instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToShort HC_lessThanOrEqualToShort
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedChar(unsigned char value);

/**
 lessThanOrEqualToUnsignedChar(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned char</code>.

 @param value  The <code>unsigned char</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned char</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToUnsignedChar instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToUnsignedChar HC_lessThanOrEqualToUnsignedChar
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedInt(unsigned int value);

/**
 lessThanOrEqualToUnsignedInt(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned int</code>.

 @param value  The <code>unsigned int</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned int</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToUnsignedInt instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToUnsignedInt HC_lessThanOrEqualToUnsignedInt
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedLong(unsigned long value);

/**
 lessThanOrEqualToUnsignedLong(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned long</code>.

 @param value  The <code>unsigned long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned long</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToUnsignedLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToUnsignedLong HC_lessThanOrEqualToUnsignedLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedLongLong(unsigned long long value);

/**
 lessThanOrEqualToUnsignedLongLong(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned long long</code>.

 @param value  The <code>unsigned long long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned long long</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToUnsignedLongLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToUnsignedLongLong HC_lessThanOrEqualToUnsignedLongLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedShort(unsigned short value);

/**
 lessThanOrEqualToUnsignedShort(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned short</code>.

 @param value  The <code>unsigned short</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned short</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToUnsignedShort instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToUnsignedShort HC_lessThanOrEqualToUnsignedShort
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToInteger(NSInteger value);

/**
 lessThanOrEqualToInteger(value) -
 Matches if object is equal to @c NSNumber created from an @c NSInteger.

 @param value  The @c NSInteger value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an @c NSInteger @a value and compares the
 evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToInteger instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToInteger HC_lessThanOrEqualToInteger
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_lessThanOrEqualToUnsignedInteger(NSUInteger value);

/**
 lessThanOrEqualToUnsignedInteger(value) -
 Matches if object is equal to @c NSNumber created from an @c NSUInteger.

 @param value  The @c NSUInteger value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an @c NSUInteger @a value and compares the
 evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_lessThanOrEqualToUnsignedInteger instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define lessThanOrEqualToUnsignedInteger HC_lessThanOrEqualToUnsignedInteger
#endif
