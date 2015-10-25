//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


FOUNDATION_EXPORT id HC_equalToChar(char value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToChar(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified char value.
 * @param value The char value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToChar instead.
 */
#define equalToChar HC_equalToChar
#endif


FOUNDATION_EXPORT id HC_equalToDouble(double value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToDouble(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified double value.
 * @param value The double value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToDouble instead.
 */
#define equalToDouble HC_equalToDouble
#endif


FOUNDATION_EXPORT id HC_equalToFloat(float value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToFloat(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified float value.
 * @param value The float value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToFloat instead.
 */
#define equalToFloat HC_equalToFloat
#endif


FOUNDATION_EXPORT id HC_equalToInt(int value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToInt(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified int value.
 * @param value The int value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToInt instead.
 */
#define equalToInt HC_equalToInt
#endif


FOUNDATION_EXPORT id HC_equalToLong(long value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToLong(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified long value.
 * @param value The long value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToLong instead.
 */
#define equalToLong HC_equalToLong
#endif


FOUNDATION_EXPORT id HC_equalToLongLong(long long value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToLongLong(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified long long value.
 * @param value The long long value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToLongLong instead.
 */
#define equalToLongLong HC_equalToLongLong
#endif


FOUNDATION_EXPORT id HC_equalToShort(short value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToShort(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified short value.
 * @param value The short value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToShort instead.
 */
#define equalToShort HC_equalToShort
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedChar(unsigned char value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToUnsignedChar(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned char value.
 * @param value The unsigned char value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToUnsignedChar instead.
 */
#define equalToUnsignedChar HC_equalToUnsignedChar
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedInt(unsigned int value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToUnsignedInt(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned int value.
 * @param value  The unsigned int value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToUnsignedInt instead.
 */
#define equalToUnsignedInt HC_equalToUnsignedInt
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedLong(unsigned long value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToUnsignedLong(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned long value.
 * @param value The unsigned long value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToUnsignedLong instead.
 */
#define equalToUnsignedLong HC_equalToUnsignedLong
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedLongLong(unsigned long long value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToUnsignedLongLong(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned long long value.
 * @param value The unsigned long long value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToUnsignedLongLong instead.
 */
#define equalToUnsignedLongLong HC_equalToUnsignedLongLong
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedShort(unsigned short value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToUnsignedShort(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned short value.
 * @param value The unsigned short value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToUnsignedShort instead.
 */
#define equalToUnsignedShort HC_equalToUnsignedShort
#endif


FOUNDATION_EXPORT id HC_equalToInteger(NSInteger value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToInteger(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified NSInteger value.
 * @param value The NSInteger value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToInteger instead.
 */
#define equalToInteger HC_equalToInteger
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedInteger(NSUInteger value);

#ifndef HC_DISABLE_SHORT_SYNTAX
/*!
 * @abstract equalToUnsignedInteger(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified NSUInteger value.
 * @param value The NSUInteger value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, <code>#define HC_DISABLE_SHORT_SYNTAX</code> and use the synonym
 * HC_equalToUnsignedInteger instead.
 */
#define equalToUnsignedInteger HC_equalToUnsignedInteger
#endif
