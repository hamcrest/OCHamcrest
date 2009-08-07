#import "HCIsEqual.h"

#import "HCDescription.h"


@implementation HCIsEqual

+ (HCIsEqual*) isEqualTo:(id)equalArg;
{
    return [[[HCIsEqual alloc] initEqualTo:equalArg] autorelease];
}


- (id) initEqualTo:(id)equalArg
{
    self = [super init];
    if (self != nil)
        object = [equalArg retain];
    return self;
}


- (void) dealloc
{
    [object release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    if (item == nil)
        return object == nil;
    else
        return [item isEqual:object];
}


- (void) describeTo:(id<HCDescription>)description
{
    [description appendValue:object];
}

@end


extern "C" {

id<HCMatcher> HC_equalTo(id equalArg)
{
    return [HCIsEqual isEqualTo:equalArg];
}

}   // extern "C"
