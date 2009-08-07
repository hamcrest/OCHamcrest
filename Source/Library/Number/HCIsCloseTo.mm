#import "HCIsCloseTo.h"

#import <cmath>
#import "HCDescription.h"

using namespace std;


@implementation HCIsCloseTo

+ (HCIsCloseTo*) isCloseTo:(double)aValue within:(double)anError
{
    return [[[HCIsCloseTo alloc] initWithValue:aValue error:anError] autorelease];
}


- (id) initWithValue:(double)aValue error:(double)anError
{
    self = [super init];
    if (self != nil)
    {
        value = aValue;
        error = anError;
    }
    return self;
}


- (BOOL) matches:(id)item
{
    if (![item respondsToSelector:@selector(doubleValue)])
        return NO;
    
    return abs([item doubleValue] - value) <= error;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[[description appendText:@"a numeric value within "]
                    appendValue:[NSNumber numberWithDouble:error]]
                    appendText:@" of "]
                    appendValue:[NSNumber numberWithDouble:value]];
}

@end


extern "C" {

id<HCMatcher> HC_closeTo(double aValue, double anError)
{
    return [HCIsCloseTo isCloseTo:aValue within:anError];
}

}   // extern "C"
