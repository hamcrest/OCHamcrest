#import "HCSubstringMatcher.h"

#import "HCDescription.h"
#import "HCRequireNonNilString.h"

using namespace hamstring;


@interface HCSubstringMatcher (SubclassResponsibility)
- (NSString*) relationship;
@end


@implementation HCSubstringMatcher

- (id) initWithSubstring:(NSString*)aSubstring
{
    requireNonNilString(aSubstring);
    
    self = [super init];
    if (self != nil)
        substring = [aSubstring copy];
    return self;
}


- (void) dealloc
{
    [substring release];
    
    [super dealloc];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[[description appendText:@"a string "]
                    appendText:[self relationship]]
                    appendText:@" "]
                    appendValue:substring];
}

@end
