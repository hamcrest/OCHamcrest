//
//  OCHamcrest - HCDescribedAs.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCDescribedAs.h"

    // OCHamcrest
#import "HCDescription.h"

    // OCHamcrest internal
#import "HCIntegerTypes.h"

    // C++
#import <cstdarg>
#import <cctype>
#import <utility>
using namespace std;


namespace {

/*
    Splits string into decimal number (-1 if not found) and remaining string.
*/
pair<int, NSString*> separate(NSString* component)
{
    unsigned int index = 0;
    bool gotIndex = false;
    
    NSUInteger length = [component length];
    NSUInteger charIndex;
    for (charIndex = 0; charIndex < length; ++charIndex)
    {
        unichar character = [component characterAtIndex:charIndex];
        if (!isdigit(character))
            break;
        index = index * 10 + character - '0';
        gotIndex = true;
    }
    
    if (!gotIndex)
        return make_pair(-1, component);
    else
        return make_pair(index, [component substringFromIndex:charIndex]);
}

}   // namespace


@implementation HCDescribedAs

+ (HCDescribedAs*) describedAs:(NSString*)description
                    forMatcher:(id<HCMatcher>)aMatcher
                    overValues:(NSArray*)templateValues
{
    return [[[HCDescribedAs alloc] initWithDescription: description
                                            forMatcher: aMatcher
                                            overValues: templateValues] autorelease];
}


- (id) initWithDescription:(NSString*)description
                forMatcher:(id<HCMatcher>)aMatcher
                overValues:(NSArray*)templateValues
{
    self = [super init];
    if (self != nil)
    {
        descriptionTemplate = [description copy];
        matcher = [aMatcher retain];
        values = [templateValues retain];
    }
    return self;
}


- (void) dealloc
{
    [values release];
    [matcher release];
    [descriptionTemplate release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    return [matcher matches:item];
}


- (void) describeTo:(id<HCDescription>)description
{
    NSArray* components = [descriptionTemplate componentsSeparatedByString:@"%"];
    bool firstTime = true;
#if defined(OBJC_API_VERSION) && OBJC_API_VERSION >= 2
    for (NSString* oneComponent in components)
#else
    NSEnumerator* enumerator = [components objectEnumerator];
    NSString* oneComponent;
    while ((oneComponent = [enumerator nextObject]) != nil)
#endif
    {
        if (firstTime)
        {
            firstTime = false;
            [description appendText:oneComponent];
        }
        else
        {
            pair<int, NSString*> parseIndex = separate(oneComponent);
            if (parseIndex.first < 0)
                [[description appendText:@"%"] appendText:oneComponent];
            else
            {
                [description appendValue:[values objectAtIndex:parseIndex.first]];
                [description appendText:parseIndex.second];
            }
        }
    }
}

@end


extern "C" {

id<HCMatcher> HC_describedAs(NSString* description, id<HCMatcher> matcher, ...)
{
    NSMutableArray* valueList = [NSMutableArray array];
    
    va_list args;
    va_start(args, matcher);
    id value = va_arg(args, id);
    while (value != nil)
    {
        [valueList addObject:value];
        value = va_arg(args, id);
    }
    va_end(args);
    
    return [HCDescribedAs describedAs:description forMatcher:matcher overValues:valueList];
}

}   // extern "C"
