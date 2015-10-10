//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


FOUNDATION_EXPORT id HC_equalToBool(BOOL value) __attribute__((deprecated));

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToBool(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified BOOL value.
 * @param value The BOOL value from which to create an NSNumber.
 * @deprecated Version 4.1.0. Use @ref isTrue() or @ref isFalse() instead.
 * @discussion
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToBool instead.
 */
#define equalToBool HC_equalToBool
#endif

@interface HCIsEqualToBool : HCBaseMatcher

@property (nonatomic, assign, readonly) BOOL value;

- (instancetype)initWithValue:(BOOL)value;

@end


FOUNDATION_EXPORT id HC_equalToChar(char value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToChar(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified char value.
 * @param value The char value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToChar instead.
 */
#define equalToChar HC_equalToChar
#endif


FOUNDATION_EXPORT id HC_equalToDouble(double value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToDouble(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified double value.
 * @param value The double value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToDouble instead.
 */
#define equalToDouble HC_equalToDouble
#endif


FOUNDATION_EXPORT id HC_equalToFloat(float value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToFloat(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified float value.
 * @param value The float value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToFloat instead.
 */
#define equalToFloat HC_equalToFloat
#endif


FOUNDATION_EXPORT id HC_equalToInt(int value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToInt(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified int value.
 * @param value The int value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToInt instead.
 */
#define equalToInt HC_equalToInt
#endif


FOUNDATION_EXPORT id HC_equalToLong(long value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToLong(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified long value.
 * @param value The long value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToLong instead.
 */
#define equalToLong HC_equalToLong
#endif


FOUNDATION_EXPORT id HC_equalToLongLong(long long value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToLongLong(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified long long value.
 * @param value The long long value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToLongLong instead.
 */
#define equalToLongLong HC_equalToLongLong
#endif


FOUNDATION_EXPORT id HC_equalToShort(short value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToShort(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified short value.
 * @param value The short value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToShort instead.
 */
#define equalToShort HC_equalToShort
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedChar(unsigned char value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedChar(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned char value.
 * @param value The unsigned char value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedChar instead.
 */
#define equalToUnsignedChar HC_equalToUnsignedChar
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedInt(unsigned int value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedInt(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned int value.
 * @param value  The unsigned int value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedInt instead.
 */
#define equalToUnsignedInt HC_equalToUnsignedInt
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedLong(unsigned long value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedLong(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned long value.
 * @param value The unsigned long value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedLong instead.
 */
#define equalToUnsignedLong HC_equalToUnsignedLong
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedLongLong(unsigned long long value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedLongLong(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned long long value.
 * @param value The unsigned long long value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedLongLong instead.
 */
#define equalToUnsignedLongLong HC_equalToUnsignedLongLong
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedShort(unsigned short value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedShort(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified unsigned short value.
 * @param value The unsigned short value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedShort instead.
 */
#define equalToUnsignedShort HC_equalToUnsignedShort
#endif


FOUNDATION_EXPORT id HC_equalToInteger(NSInteger value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToInteger(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified NSInteger value.
 * @param value The NSInteger value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToInteger instead.
 */
#define equalToInteger HC_equalToInteger
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedInteger(NSUInteger value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedInteger(value) -
 * Creates a matcher that matches when the examined object is equal to an NSNumber created from the
 * specified NSUInteger value.
 * @param value The NSUInteger value from which to create an NSNumber.
 * @discussion Consider using <code>equalTo(\@(value))</code> instead.
 *
 * <b>Name Clash</b><br />
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedInteger instead.
 */
#define equalToUnsignedInteger HC_equalToUnsignedInteger
#endif
