//
//  OCHamcrest - HCIsEqualIgnoringCase.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsEqualIgnoringCase.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCRequireNonNilObject.h"


@implementation HCIsEqualIgnoringCase

+ (id)isEqualIgnoringCase:(NSString *)aString
{
    return [[[self alloc] initWithString:aString] autorelease];
}


- (id)initWithString:(NSString *)aString
{
    HCRequireNonNilObject(aString);
    
    self = [super init];
    if (self != nil)
        string = [aString copy];
    return self;
}


- (void)dealloc
{
    [string release];
    [super dealloc];
}


- (BOOL)matches:(id)item
{
    if (![item isKindOfClass:[NSString class]])
        return NO;
    
    return [string caseInsensitiveCompare:item] == NSOrderedSame;
}


- (void)describeTo:(id<HCDescription>)description
{
    [[description appendDescriptionOf:string]
                  appendText:@" ignoring case"];
}

@end

//--------------------------------------------------------------------------------------------------

OBJC_EXPORT id<HCMatcher> HC_equalToIgnoringCase(NSString *string)
{
    return [HCIsEqualIgnoringCase isEqualIgnoringCase:string];
}
