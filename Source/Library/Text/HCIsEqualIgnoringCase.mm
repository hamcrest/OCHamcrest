//
//  OCHamcrest - HCIsEqualIgnoringCase.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsEqualIgnoringCase.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCRequireNonNilString.h"
using namespace hamcrest;


@implementation HCIsEqualIgnoringCase

+ (HCIsEqualIgnoringCase*) isEqualIgnoringCase:(NSString*)aString
{
    return [[[HCIsEqualIgnoringCase alloc] initWithString:aString] autorelease];
}


- (id) initWithString:(NSString*)aString
{
    requireNonNilString(aString);
    
    self = [super init];
    if (self != nil)
        string = [aString copy];
    return self;
}


- (void) dealloc
{
    [string release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    if (![item isKindOfClass:[NSString class]])
        return NO;
    
    return [string caseInsensitiveCompare:item] == NSOrderedSame;
}


- (void) describeTo:(id<HCDescription>)description
{
    [[[description appendText:@"equalToIgnoringCase("]
                    appendValue:string]
                    appendText:@")"];
}

@end


extern "C" {

id<HCMatcher> HC_equalToIgnoringCase(NSString* aString)
{
    return [HCIsEqualIgnoringCase isEqualIgnoringCase:aString];
}

}   // extern "C"
