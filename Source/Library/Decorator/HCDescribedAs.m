//
//  OCHamcrest - HCDescribedAs.mm
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCDescribedAs.h"

#import "HCDescription.h"
#import <cstdarg>
#import <cctype>
#import <utility>
using namespace std;


namespace {

/**
    Splits string into decimal number (-1 if not found) and remaining string.
 */
pair<int, NSString*> separate(NSString *component)
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


#pragma mark -

@implementation HCDescribedAs

+ (id)describedAs:(NSString *)description
       forMatcher:(id<HCMatcher>)aMatcher
       overValues:(NSArray *)templateValues
{
    return [[[self alloc] initWithDescription:description
                                   forMatcher:aMatcher
                                   overValues:templateValues] autorelease];
}

- (id)initWithDescription:(NSString *)description
                forMatcher:(id<HCMatcher>)aMatcher
                overValues:(NSArray *)templateValues
{
    self = [super init];
    if (self)
    {
        descriptionTemplate = [description copy];
        matcher = [aMatcher retain];
        values = [templateValues retain];
    }
    return self;
}

- (void)dealloc
{
    [values release];
    [matcher release];
    [descriptionTemplate release];
    [super dealloc];
}

- (BOOL)matches:(id)item
{
    return [matcher matches:item];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [matcher describeMismatchOf:item to:mismatchDescription];
}

- (void)describeTo:(id<HCDescription>)description
{
    NSArray *components = [descriptionTemplate componentsSeparatedByString:@"%"];
    bool firstTime = true;
    for (NSString *oneComponent in components)
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
                [description appendDescriptionOf:[values objectAtIndex:parseIndex.first]];
                [description appendText:parseIndex.second];
            }
        }
    }
}

@end


#pragma mark -

OBJC_EXPORT id<HCMatcher> HC_describedAs(NSString *description, id<HCMatcher> matcher, ...)
{
    NSMutableArray *valueList = [NSMutableArray array];
    
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
