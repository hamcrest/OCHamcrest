#import "HCHasDescription.h"

#import "HCDescription.h"
#import "HCWrapShortcut.h"


@implementation HCHasDescription

+ (HCHasDescription*) hasDescription:(id<HCMatcher>)theDescriptionMatcher
{
    return [[[HCHasDescription alloc] initWithDescription:theDescriptionMatcher] autorelease];
}


- (id) initWithDescription:(id<HCMatcher>)theDescriptionMatcher;
{
    self = [super init];
    if (self != nil)
        descriptionMatcher = [theDescriptionMatcher retain];
    return self;
}


- (void) dealloc
{
    [descriptionMatcher release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    return [descriptionMatcher matches:[item description]];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[description appendText:@"description("]
                    appendDescriptionOf:descriptionMatcher]
                    appendText:@")"];
}

@end


extern "C" {

id<HCMatcher> HC_hasDescription(id item)
{
    return [HCHasDescription hasDescription:HC_wrapShortcut(item)];
}

}   // extern "C"
