//
//  OCHamcrest - HCMatcherAssert.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCMatcherAssert.h"

    // OCHamcrest
#import "HCStringDescription.h"
#import "HCMatcher.h"

    // Objective-C
#import <objc/objc-class.h>


namespace {

/**
    Create OCUnit failure
    
    With OCUnit's extension to NSException, this is effectively the same as
@code
[NSException failureInFile: [NSString stringWithUTF8String:fileName]
                    atLine: lineNumber
           withDescription: description]
@endcode
    except we use an NSInvocation so that OCUnit (SenTestingKit) does not have to be linked.
*/
NSException* createOCUnitException(const char* fileName, int lineNumber, NSString* description)
{
    NSException* result = nil;

    // See http://www.omnigroup.com/mailman/archive/macosx-dev/2001-February/021441.html
    // for an explanation of how to use create an NSInvocation of a class method.
    SEL selector = @selector(failureInFile:atLine:withDescription:);
    NSMethodSignature* signature =
        [[NSException class]->isa instanceMethodSignatureForSelector:selector];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:[NSException class]];
    [invocation setSelector:selector];
    
    id fileArg = [NSString stringWithUTF8String:fileName];
    [invocation setArgument:&fileArg atIndex:2];
    [invocation setArgument:&lineNumber atIndex:3];
    [invocation setArgument:&description atIndex:4];
    
    [invocation retainArguments];
    [invocation invoke];
    [invocation getReturnValue:&result];

    return result;
}


NSException* createAssertThatFailure(const char* fileName, int lineNumber, NSString* description)
{
    // If the Hamcrest client has linked to OCUnit, generate an OCUnit failure.
    if (NSClassFromString(@"SenTestCase") != Nil)
        return createOCUnitException(fileName, lineNumber, description);

    NSString* failureReason = [NSString stringWithFormat:@"%s:%d: matcher error: %@",
                                                        fileName, lineNumber, description];
    return [NSException exceptionWithName:@"Hamcrest Error" reason:failureReason userInfo:nil];
}

}   // namespace


extern "C" {

void HC_assertThatWithLocation(id actual, id<HCMatcher> matcher,
                               const char* fileName, int lineNumber)
{
    if (![matcher matches:actual])
    {
        HCStringDescription* description = [HCStringDescription stringDescription];
        [[[[description appendText:@"Expected "]
                        appendDescriptionOf:matcher]
                        appendText:@", got "]
                        appendValue:actual];
        @throw createAssertThatFailure(fileName, lineNumber, [description description]);
    }
}

}   // extern "C"
