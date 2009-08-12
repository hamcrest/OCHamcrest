//
//  OCHamcrest - HCSubstringMatcher.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCSubstringMatcher.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCRequireNonNilString.h"
using namespace hamcrest;


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
