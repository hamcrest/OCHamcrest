#import <hamcrest/HCSubstringMatcher.h>


/**
    Tests if the argument is a string that contains a substring.
*/
@interface HCStringContains : HCSubstringMatcher
{
}

+ (HCStringContains*) stringContains:(NSString*)aSubstring;

@end


#ifdef __cplusplus
extern "C" {
#endif

id<HCMatcher> HC_containsString(NSString* aSubstring);

#ifdef __cplusplus
}
#endif


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_containsString, available if HC_SHORTHAND is defined.
*/
#define containsString HC_containsString

#endif
