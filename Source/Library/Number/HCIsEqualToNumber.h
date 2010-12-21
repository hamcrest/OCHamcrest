//
//  OCHamcrest - HCIsEqualToNumber.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <OCHamcrest/HCBaseMatcher.h>


/**
    Is the BOOL value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToBool(BOOL value);

/**
    Shorthand for @ref HC_equalToBool, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToBool HC_equalToBool
#endif


/**
    Is the char value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToChar(char value);

/**
    Shorthand for @ref HC_equalToChar, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToChar HC_equalToChar
#endif


/**
    Is the double value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToDouble(double value);

/**
    Shorthand for @ref HC_equalToDouble, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToDouble HC_equalToDouble
#endif

/**
    Is the float value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToFloat(float value);

/**
    Shorthand for @ref HC_equalToFloat, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToFloat HC_equalToFloat
#endif


/**
    Is the int value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToInt(int value);

/**
    Shorthand for @ref HC_equalToInt, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToInt HC_equalToInt
#endif


/**
    Is the long value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToLong(long value);

/**
    Shorthand for @ref HC_equalToLong, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToLong HC_equalToLong
#endif


/**
    Is the long long value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToLongLong(long long value);

/**
    Shorthand for @ref HC_equalToLongLong, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToLongLong HC_equalToLongLong
#endif


/**
    Is the short value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToShort(short value);

/**
    Shorthand for @ref HC_equalToShort, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToShort HC_equalToShort
#endif


/**
    Is the unsigned char value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedChar(unsigned char value);

/**
    Shorthand for @ref HC_equalToUnsignedChar, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedChar HC_equalToUnsignedChar
#endif


/**
    Is the unsigned int value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedInt(unsigned int value);

/**
    Shorthand for @ref HC_equalToUnsignedInt, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedInt HC_equalToUnsignedInt
#endif


/**
    Is the unsigned long value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedLong(unsigned long value);

/**
    Shorthand for @ref HC_equalToUnsignedLong, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedLong HC_equalToUnsignedLong
#endif


/**
    Is the unsigned long long value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedLongLong(unsigned long long value);

/**
    Shorthand for @ref HC_equalToUnsignedLongLong, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedLongLong HC_equalToUnsignedLongLong
#endif


/**
    Is the unsigned short value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedShort(unsigned short value);

/**
    Shorthand for @ref HC_equalToUnsignedShort, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedShort HC_equalToUnsignedShort
#endif


/**
    Is the NSInteger value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToInteger(NSInteger value);

/**
    Shorthand for @ref HC_equalToInteger, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToInteger HC_equalToInteger
#endif


/**
    Is the NSUInteger value, converted to an NSNumber, equal to another object?
    @ingroup number
 */
OBJC_EXPORT id<HCMatcher> HC_equalToUnsignedInteger(NSUInteger value);

/**
    Shorthand for @ref HC_equalToUnsignedInteger, available if HC_SHORTHAND is defined.
    @ingroup number
 */
#ifdef HC_SHORTHAND
    #define equalToUnsignedInteger HC_equalToUnsignedInteger
#endif
