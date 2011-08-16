//
//  OCHamcrest - HCIsEqualToNumber.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import <OCHamcrest/HCBaseMatcher.h>


OBJC_EXPORT id<HCMatcher> HC_equalToBool(BOOL value);

/**
    Matches if object is equal to @c NSNumber created from a @c BOOL.
    
    @param value  The @c BOOL value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from a @c BOOL @a value and compares the evaluated
    object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToBool instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToBool(value) HC_equalToBool(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToChar(char value);

/**
    Matches if object is equal to @c NSNumber created from a @c char.
    
    @param value  The @c char value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from a @c char @a value and compares the evaluated
    object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToChar instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToChar(value) HC_equalToChar(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToDouble(double value);

/**
    Matches if object is equal to @c NSNumber created from a @c double.
    
    @param value  The @c double value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from a @c double @a value and compares the evaluated
    object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToDouble instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToDouble(value) HC_equalToDouble(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToFloat(float value);

/**
    Matches if object is equal to @c NSNumber created from a @c float.
    
    @param value  The @c float value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from a @c float @a value and compares the evaluated
    object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToFloat instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToFloat(value) HC_equalToFloat(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToInt(int value);

/**
    Matches if object is equal to @c NSNumber created from an @c int.
    
    @param value  The @c int value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from a @c int @a value and compares the evaluated
    object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToInt instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToInt(value) HC_equalToInt(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToLong(long value);

/**
    Matches if object is equal to @c NSNumber created from a @c long.
    
    @param value  The @c long value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from a @c long @a value and compares the evaluated
    object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToLong instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToLong(value) HC_equalToLong(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToLongLong(long long value);

/**
    Matches if object is equal to @c NSNumber created from a <code>long long</code>.
    
    @param value  The <code>long long</code> value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from a <code>long long</code> @a value and compares
    the evaluated object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToLongLong instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToLongLong(value) HC_equalToLongLong(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToShort(short value);

/**
    Matches if object is equal to @c NSNumber created from a @c short.
    
    @param value  The @c short value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from a @c short @a value and compares the evaluated
    object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToShort instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToShort(value) HC_equalToShort(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedChar(unsigned char value);

/**
    Matches if object is equal to @c NSNumber created from an <code>unsigned char</code>.
    
    @param value  The <code>unsigned char</code> value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from an <code>unsigned char</code> @a value and
    compares the evaluated object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToUnsignedChar instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedChar(value) HC_equalToUnsignedChar(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedInt(unsigned int value);

/**
    Matches if object is equal to @c NSNumber created from an <code>unsigned int</code>.
    
    @param value  The <code>unsigned int</code> value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from an <code>unsigned int</code> @a value and
    compares the evaluated object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToUnsignedInt instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedInt(value) HC_equalToUnsignedInt(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedLong(unsigned long value);

/**
    Matches if object is equal to @c NSNumber created from an <code>unsigned long</code>.
    
    @param value  The <code>unsigned long</code> value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from an <code>unsigned long</code> @a value and
    compares the evaluated object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToUnsignedLong instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedLong(value) HC_equalToUnsignedLong(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedLongLong(unsigned long long value);

/**
    Matches if object is equal to @c NSNumber created from an <code>unsigned long long</code>.
    
    @param value  The <code>unsigned long long</code> value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from an <code>unsigned long long</code> @a value and
    compares the evaluated object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToUnsignedLongLong instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedLongLong(value) HC_equalToUnsignedLongLong(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedShort(unsigned short value);

/**
    Matches if object is equal to @c NSNumber created from an <code>unsigned short</code>.
    
    @param value  The <code>unsigned short</code> value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from an <code>unsigned short</code> @a value and
    compares the evaluated object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToUnsignedShort instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedShort(value) HC_equalToUnsignedShort(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToInteger(NSInteger value);

/**
    Matches if object is equal to @c NSNumber created from an @c NSInteger.
    
    @param value  The @c NSInteger value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from an @c NSInteger @a value and compares the
    evaluated object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToInteger instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToInteger(value) HC_equalToInteger(value)
#endif


OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedInteger(NSUInteger value);

/**
    Matches if object is equal to @c NSNumber created from an @c NSUInteger.
    
    @param value  The @c NSUInteger value from which to create an @c NSNumber.
    
    This matcher creates an @c NSNumber object from an @c NSUInteger @a value and compares the
    evaluated object to it for equality.    
    
    (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
    @c HC_equalToUnsignedInteger instead.)

    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedInteger(value) HC_equalToUnsignedInteger(value)
#endif
