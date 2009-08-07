#import <hamcrest/HCBaseMatcher.h>


@interface HCSubstringMatcher : HCBaseMatcher
{
    NSString* substring;
}

- (id) initWithSubstring:(NSString*)aSubstring;

@end
