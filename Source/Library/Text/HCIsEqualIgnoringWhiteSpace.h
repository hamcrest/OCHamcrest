#import <hamcrest/HCBaseMatcher.h>


/**
    Tests if a string is equal to another string, ignoring any changes in whitespace.
*/
@interface HCIsEqualIgnoringWhiteSpace : HCBaseMatcher
{
    NSString* originalString;
    NSString* strippedString;
}

+ (HCIsEqualIgnoringWhiteSpace*) isEqualIgnoringWhiteSpace:(NSString*)aString;
- (id) initWithString:(NSString*)aString;

@end


#ifdef __cplusplus
extern "C" {
#endif

id<HCMatcher> HC_equalToIgnoringWhiteSpace(NSString* aString);

#ifdef __cplusplus
}
#endif


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_endsWith, available if HC_SHORTHAND is defined.
*/
#define equalToIgnoringWhiteSpace HC_equalToIgnoringWhiteSpace

#endif
