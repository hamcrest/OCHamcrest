//
//  HCIsGreaterThanOrEqualToNumber.h
//  OCHamcrest
//
//  Created by Kevin Lundberg on 10/25/14.
//  Copyright (c) 2014 hamcrest.org. All rights reserved.
//

#import <OCHamcrest/HCBaseMatcher.h>

FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToChar(char value);

/**
 greaterThanOrEqualToChar(value) -
 Matches if object is equal to @c NSNumber created from a @c char.

 @param value  The @c char value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c char @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToChar instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToChar HC_greaterThanOrEqualToChar
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToDouble(double value);

/**
 greaterThanOrEqualToDouble(value) -
 Matches if object is equal to @c NSNumber created from a @c double.

 @param value  The @c double value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c double @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToDouble instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToDouble HC_greaterThanOrEqualToDouble
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToFloat(float value);

/**
 greaterThanOrEqualToFloat(value) -
 Matches if object is equal to @c NSNumber created from a @c float.

 @param value  The @c float value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c float @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToFloat instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToFloat HC_greaterThanOrEqualToFloat
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToInt(int value);

/**
 greaterThanOrEqualToInt(value) -
 Matches if object is equal to @c NSNumber created from an @c int.

 @param value  The @c int value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c int @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToInt instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToInt HC_greaterThanOrEqualToInt
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToLong(long value);

/**
 greaterThanOrEqualToLong(value) -
 Matches if object is equal to @c NSNumber created from a @c long.

 @param value  The @c long value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c long @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToLong HC_greaterThanOrEqualToLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToLongLong(long long value);

/**
 greaterThanOrEqualToLongLong(value) -
 Matches if object is equal to @c NSNumber created from a <code>long long</code>.

 @param value  The <code>long long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a <code>long long</code> @a value and compares
 the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToLongLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToLongLong HC_greaterThanOrEqualToLongLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToShort(short value);

/**
 greaterThanOrEqualToShort(value) -
 Matches if object is equal to @c NSNumber created from a @c short.

 @param value  The @c short value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from a @c short @a value and compares the evaluated
 object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToShort instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToShort HC_greaterThanOrEqualToShort
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedChar(unsigned char value);

/**
 greaterThanOrEqualToUnsignedChar(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned char</code>.

 @param value  The <code>unsigned char</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned char</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToUnsignedChar instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToUnsignedChar HC_greaterThanOrEqualToUnsignedChar
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedInt(unsigned int value);

/**
 greaterThanOrEqualToUnsignedInt(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned int</code>.

 @param value  The <code>unsigned int</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned int</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToUnsignedInt instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToUnsignedInt HC_greaterThanOrEqualToUnsignedInt
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedLong(unsigned long value);

/**
 greaterThanOrEqualToUnsignedLong(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned long</code>.

 @param value  The <code>unsigned long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned long</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToUnsignedLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToUnsignedLong HC_greaterThanOrEqualToUnsignedLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedLongLong(unsigned long long value);

/**
 greaterThanOrEqualToUnsignedLongLong(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned long long</code>.

 @param value  The <code>unsigned long long</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned long long</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToUnsignedLongLong instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToUnsignedLongLong HC_greaterThanOrEqualToUnsignedLongLong
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedShort(unsigned short value);

/**
 greaterThanOrEqualToUnsignedShort(value) -
 Matches if object is equal to @c NSNumber created from an <code>unsigned short</code>.

 @param value  The <code>unsigned short</code> value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an <code>unsigned short</code> @a value and
 compares the evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToUnsignedShort instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToUnsignedShort HC_greaterThanOrEqualToUnsignedShort
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToInteger(NSInteger value);

/**
 greaterThanOrEqualToInteger(value) -
 Matches if object is equal to @c NSNumber created from an @c NSInteger.

 @param value  The @c NSInteger value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an @c NSInteger @a value and compares the
 evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToInteger instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToInteger HC_greaterThanOrEqualToInteger
#endif


FOUNDATION_EXPORT id<HCMatcher> HC_greaterThanOrEqualToUnsignedInteger(NSUInteger value);

/**
 greaterThanOrEqualToUnsignedInteger(value) -
 Matches if object is equal to @c NSNumber created from an @c NSUInteger.

 @param value  The @c NSUInteger value from which to create an @c NSNumber.

 This matcher creates an @c NSNumber object from an @c NSUInteger @a value and compares the
 evaluated object to it for equality.

 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_greaterThanOrEqualToUnsignedInteger instead.)

 @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
#define greaterThanOrEqualToUnsignedInteger HC_greaterThanOrEqualToUnsignedInteger
#endif
