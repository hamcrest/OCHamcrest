//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import <OCHamcrest/HCBaseMatcher.h>


FOUNDATION_EXPORT id HC_equalToBool(BOOL value) __attribute__((deprecated));

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToBool(value) -
 * Matches if object is equal to NSNumber created from a BOOL.
 * @param value The BOOL value from which to create an NSNumber.
 * @deprecated Version 4.1.0. Use @ref isTrue() or @ref isFalse() instead.
 * @discussion This matcher creates an NSNumber object from a BOOL value and compares the evaluated
 * object to it for equality.
 *
 * @attribute Name Clash
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
 * Matches if object is equal to NSNumber created from a char.
 * @param value The char value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from a char value and compares the evaluated
 * object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToChar instead.
 */
#define equalToChar HC_equalToChar
#endif


FOUNDATION_EXPORT id HC_equalToDouble(double value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToDouble(value) -
 * Matches if object is equal to NSNumber created from a double.
 * @param value The double value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from a double value and compares the
 * evaluated object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToDouble instead.
 */
#define equalToDouble HC_equalToDouble
#endif


FOUNDATION_EXPORT id HC_equalToFloat(float value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToFloat(value) -
 * Matches if object is equal to NSNumber created from a float.
 * @param value The float value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from a float value and compares the evaluated
 * object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToFloat instead.
 */
#define equalToFloat HC_equalToFloat
#endif


FOUNDATION_EXPORT id HC_equalToInt(int value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToInt(value) -
 * Matches if object is equal to NSNumber created from an int.
 * @param value The int value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from a int value and compares the evaluated
 * object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToInt instead.
 */
#define equalToInt HC_equalToInt
#endif


FOUNDATION_EXPORT id HC_equalToLong(long value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToLong(value) -
 * Matches if object is equal to NSNumber created from a long.
 * @param value The long value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from a long value and compares the evaluated
 * object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToLong instead.
 */
#define equalToLong HC_equalToLong
#endif


FOUNDATION_EXPORT id HC_equalToLongLong(long long value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToLongLong(value) -
 * Matches if object is equal to NSNumber created from a long long.
 * @param value The long long value from which to create an NSNumber.
 * This matcher creates an NSNumber object from a long long value and compares the evaluated object
 * to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToLongLong instead.
 */
#define equalToLongLong HC_equalToLongLong
#endif


FOUNDATION_EXPORT id HC_equalToShort(short value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToShort(value) -
 * Matches if object is equal to NSNumber created from a short.
 * @param value The short value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from a short value and compares the evaluated
 * object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToShort instead.
 */
#define equalToShort HC_equalToShort
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedChar(unsigned char value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedChar(value) -
 * Matches if object is equal to NSNumber created from an unsigned char.
 * @param value The unsigned char value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from an unsigned char value and compares the
 * evaluated object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedChar instead.
 */
#define equalToUnsignedChar HC_equalToUnsignedChar
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedInt(unsigned int value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedInt(value) -
 * Matches if object is equal to NSNumber created from an <code>unsigned int</code>.
 * @param value  The unsigned int value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from an unsigned int value and compares the
 * evaluated object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedInt instead.
 */
#define equalToUnsignedInt HC_equalToUnsignedInt
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedLong(unsigned long value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedLong(value) -
 * Matches if object is equal to NSNumber created from an <code>unsigned long</code>.
 * @param value The unsigned long value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from an unsigned long value and compares the
 * evaluated object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedLong instead.
 */
#define equalToUnsignedLong HC_equalToUnsignedLong
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedLongLong(unsigned long long value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedLongLong(value) -
 * Matches if object is equal to NSNumber created from an unsigned long long.
 * @param value The unsigned long long value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from an unsigned long long value and compares
 * the evaluated object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedLongLong instead.
 */
#define equalToUnsignedLongLong HC_equalToUnsignedLongLong
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedShort(unsigned short value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedShort(value) -
 * Matches if object is equal to NSNumber created from an unsigned short.
 * @param value The unsigned short value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from an unsigned short value and compares the
 * evaluated object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedShort instead.
 */
#define equalToUnsignedShort HC_equalToUnsignedShort
#endif


FOUNDATION_EXPORT id HC_equalToInteger(NSInteger value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToInteger(value) -
 * Matches if object is equal to NSNumber created from an NSInteger.
 * @param value The NSInteger value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from an NSInteger value and compares the
 * evaluated object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToInteger instead.
 */
#define equalToInteger HC_equalToInteger
#endif


FOUNDATION_EXPORT id HC_equalToUnsignedInteger(NSUInteger value);

#ifdef HC_SHORTHAND
/*!
 * @abstract equalToUnsignedInteger(value) -
 * Matches if object is equal to NSNumber created from an NSUInteger.
 * @param value The NSUInteger value from which to create an NSNumber.
 * @discussion This matcher creates an NSNumber object from an NSUInteger value and compares the
 * evaluated object to it for equality.
 *
 * @attribute Name Clash
 * In the event of a name clash, don't <code>#define HC_SHORTHAND</code> and use the synonym
 * HC_equalToUnsignedInteger instead.
 */
#define equalToUnsignedInteger HC_equalToUnsignedInteger
#endif
