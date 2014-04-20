#import <OCHamcrest/HCBaseMatcher.h>


@interface HCEmptyString : HCBaseMatcher

+ (id)emptyString;

@end


FOUNDATION_EXPORT id <HCMatcher> HC_emptyString(void);

/**
 emptyString() -
 Matches if object is a string is empty (zero length).
 
 This matcher first checks whether the evaluated object is a string. If so, it checks whether it
 is a string with no length.
 
 Example:
 
 @par
 @ref emptyString()
 
 will match "".
 
 (In the event of a name clash, don't \#define @c HC_SHORTHAND and use the synonym
 @c HC_emptyString instead.)
 
 @ingroup text_matchers
 */
#ifdef HC_SHORTHAND
    #define emptyString HC_emptyString
#endif
