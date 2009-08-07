#import "HCIsAnything.h"

#import "HCDescription.h"


@implementation HCIsAnything

+ (HCIsAnything*) isAnything
{
    return [[[HCIsAnything alloc] init] autorelease];
}


+ (HCIsAnything*) isAnythingWithDescription:(NSString*)aDescription
{
    return [[[HCIsAnything alloc] initWithDescription:aDescription] autorelease];
}


- (id) init
{
    [self initWithDescription:@"ANYTHING"];
    return self;
}


- (id) initWithDescription:(NSString*)aDescription
{
    self = [super init];
    if (self != nil)
        description = [aDescription copy];
    return self;
}


- (void) dealloc
{
    [description release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    return YES;
}


- (void) describeTo:(id<HCDescription>)aDescription
{
    [aDescription appendText:description];
}

@end


extern "C" {

id<HCMatcher> HC_anything()
{
    return [HCIsAnything isAnything];
}


id<HCMatcher> HC_anythingWithDescription(NSString* description)
{
    return [HCIsAnything isAnythingWithDescription:description];
}

}   // extern "C"
