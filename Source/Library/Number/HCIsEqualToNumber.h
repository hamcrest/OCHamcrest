//
//  OCHamcrest - HCIsEqualToNumber.h
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Is the @c BOOL value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToBool
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToBool(BOOL value);

/**
    Is the @c BOOL value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToBool, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToBool(value)  HC_equalToBool(value)
#endif


/**
    Is the @c char value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToChar
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToChar(char value);

/**
    Is the @c char value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToChar, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToChar(value)  HC_equalToChar(value)
#endif


/**
    Is the @c double value, converted to an @c NSNumber, equal to another object? 

    @b Synonym: @ref equalToDouble
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToDouble(double value);

/**
    Is the @c double value, converted to an @c NSNumber, equal to another object? 

    Synonym for @ref HC_equalToDouble, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToDouble(value)  HC_equalToDouble(value)
#endif

/**
    Is the @c float value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToFloat
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToFloat(float value);

/**
    Is the @c float value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToFloat, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToFloat(value)  HC_equalToFloat(value)
#endif


/**
    Is the @c int value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToInt
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToInt(int value);

/**
    Is the @c int value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToInt, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToInt(value)  HC_equalToInt(value)
#endif


/**
    Is the @c long value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToLong
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToLong(long value);

/**
    Is the @c long value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToLong, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToLong(value)  HC_equalToLong(value)
#endif


/**
    Is the <code>long long</code> value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToLongLong
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToLongLong(long long value);

/**
    Is the <code>long long</code> value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToLongLong, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToLongLong(value)  HC_equalToLongLong(value)
#endif


/**
    Is the @c short value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToShort
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToShort(short value);

/**
    Is the @c short value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToShort, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToShort(value)  HC_equalToShort(value)
#endif


/**
    Is the <code>unsigned char</code> value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToUnsignedChar
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedChar(unsigned char value);

/**
    Is the <code>unsigned char</code> value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToUnsignedChar, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedChar(value)  HC_equalToUnsignedChar(value)
#endif


/**
    Is the <code>unsigned int</code> value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToUnsignedInt
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedInt(unsigned int value);

/**
    Is the <code>unsigned int</code> value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToUnsignedInt, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedInt(value)  HC_equalToUnsignedInt(value)
#endif


/**
    Is the <code>unsigned long</code> value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToUnsignedLong
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedLong(unsigned long value);

/**
    Is the <code>unsigned long</code> value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToUnsignedLong, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedLong(value)  HC_equalToUnsignedLong(value)
#endif


/**
    Is the <code>unsigned long long</code> value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToUnsignedLongLong
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedLongLong(unsigned long long value);

/**
    Is the <code>unsigned long long</code> value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToUnsignedLongLong, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedLongLong(value)  HC_equalToUnsignedLongLong(value)
#endif


/**
    Is the <code>unsigned short</code> value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToUnsignedShort
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedShort(unsigned short value);

/**
    Is the <code>unsigned short</code> value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToUnsignedShort, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedShort(value)  HC_equalToUnsignedShort(value)
#endif


/**
    Is the @c NSInteger value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToInteger
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToInteger(NSInteger value);

/**
    Is the @c NSInteger value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToInteger, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToInteger(value)  HC_equalToInteger(value)
#endif


/**
    Is the @c NSUInteger value, converted to an @c NSNumber, equal to another object?

    @b Synonym: @ref equalToUnsignedInteger
    @ingroup primitive_number_matchers
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedInteger(NSUInteger value);

/**
    Is the @c NSUInteger value, converted to an @c NSNumber, equal to another object?

    Synonym for @ref HC_equalToUnsignedInteger, available if @c HC_SHORTHAND is defined.
    @ingroup primitive_number_matchers
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedInteger(value)  HC_equalToUnsignedInteger(value)
#endif
