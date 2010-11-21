//
//  OCHamcrest - HCBaseDescription.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCBaseDescription.h"

    // OCHamcrest
#import "HCMatcher.h"
#import "HCSelfDescribing.h"


@interface HCBaseDescription(Private)
- (void) toCSyntaxString:(NSString*)unformatted;
- (void) toCSyntax:(unichar)ch;
@end

@implementation HCBaseDescription

- (id<HCDescription>) appendText:(NSString*)text
{
    [self append:text];
    return self;
}


- (id<HCDescription>) appendDescriptionOf:(id<HCSelfDescribing>)value;
{
    [value describeTo:self];
    return self;
}


- (id<HCDescription>) appendValue:(id)value
{
    if (value == nil)
        [self append:@"nil"];
    else if ([value isKindOfClass:[NSString class]])
        [self toCSyntaxString:value];
    else
    {
        [self append:@"<"];
        [self append:[value description]];
        [self append:@">"];
    }
    return self;
}


- (id<HCDescription>) appendList:(NSArray*)values
                        start:(NSString*)start separator:(NSString*)separator end:(NSString*)end
{
    BOOL separate = NO;
    
    [self append:start];
    for (id item in values)
    {
        if (separate)
            [self append:separator];
        [self appendDescriptionOf:item];
        separate = YES;
    }
    [self append:end];
    return self;
}

@end


@implementation HCBaseDescription (Private)

- (void) toCSyntaxString:(NSString*)unformatted
{
    [self append:@"\""];
    NSUInteger length = [unformatted length];
    for (NSUInteger index = 0; index < length; ++index)
        [self toCSyntax:[unformatted characterAtIndex:index]];
    [self append:@"\""];
}


- (void) toCSyntax: (unichar)ch
{
    switch (ch)
    {
        case '"':
            [self append:@"\\\""];
            break;
        case '\n':
            [self append:@"\\n"];
            break;
        case '\r':
            [self append:@"\\r"];
            break;
        case '\t':
            [self append:@"\\t"];
            break;
        default:
            [self append:[NSString stringWithCharacters:&ch length:1]];
            break;
    }
}

@end
