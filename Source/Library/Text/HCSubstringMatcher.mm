//
//  OCHamcrest - HCSubstringMatcher.mm
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCSubstringMatcher.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"


@interface HCSubstringMatcher (SubclassResponsibility)
- (NSString *)relationship;
@end


@implementation HCSubstringMatcher

- (id)initWithSubstring:(NSString *)aSubstring
{
    HCRequireNonNilObject(aSubstring);
    
    self = [super init];
    if (self != nil)
        substring = [aSubstring copy];
    return self;
}


- (void)dealloc
{
    [substring release];
    
    [super dealloc];
}


- (void)describeTo:(id<HCDescription>)description
{
    [[[[description appendText:@"a string "]
                    appendText:[self relationship]]
                    appendText:@" "]
                    appendDescriptionOf:substring];
}

@end
