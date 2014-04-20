#import "OCHamcrest.h"

/**
 assertYes(actual) -
 Asserts that a BOOL value is YES.
 
 @param actual   The object to evaluate as the actual value.
 */
#define HC_assertYes(x) assertThatBool(x, equalToBool(YES))

#ifdef HC_SHORTHAND
    #define assertYes HC_assertYes
#endif

/**
 assertNo(actual) -
 Asserts that a BOOL value is NO.
 
 @param actual   The object to evaluate as the actual value.
 */
#define HC_assertNo(x) assertThatBool(x, equalToBool(NO))

#ifdef HC_SHORTHAND
    #define assertNo HC_assertNo
#endif

/**
 assertTrue(actual) -
 Asserts that a BOOL value is YES.
 
 @param actual   The object to evaluate as the actual value.
 */
#define HC_assertTrue HC_assertYes

#ifdef HC_SHORTHAND
    #define assertTrue HC_assertTrue
#endif

/**
 assertFalse(actual) -
 Asserts that a BOOL value is NO.
 
 @param actual   The object to evaluate as the actual value.
 */
#define HC_assertFalse HC_assertNo

#ifdef HC_SHORTHAND
    #define assertFalse HC_assertFalse
#endif
