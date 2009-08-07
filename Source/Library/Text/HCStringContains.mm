#import "HCStringContains.h"

#import "HCDescription.h"


@implementation HCStringContains

+ (HCStringContains*) stringContains:(NSString*)aSubstring
{
    return [[[HCStringContains alloc] initWithSubstring:aSubstring] autorelease];
}


- (BOOL) matches:(id)item
{
    if (![item respondsToSelector:@selector(rangeOfString:)])
        return NO;
    
    return [item rangeOfString:substring].location != NSNotFound;
}

@end


@implementation HCStringContains (SubclassResponsibility)

- (NSString*) relationship
{
    return @"containing";
}

@end


extern "C" {

id<HCMatcher> HC_containsString(NSString* aSubstring)
{
    return [HCStringContains stringContains:aSubstring];
}

}   // extern "C"
