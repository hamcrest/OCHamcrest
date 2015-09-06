//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCTestFailureHandlerChain.h"

#import "HCGenericTestFailureHandler.h"
#import "HCSenTestFailureHandler.h"
#import "HCXCTestFailureHandler.h"

static HCTestFailureHandler *head = nil;


@implementation HCTestFailureHandlerChain

+ (HCTestFailureHandler *)chain
{
    if (!head)
    {
        HCTestFailureHandler *xctestHandler = [[HCXCTestFailureHandler alloc] init];
        HCTestFailureHandler *ocunitHandler = [[HCSenTestFailureHandler alloc] init];
        HCTestFailureHandler *genericHandler = [[HCGenericTestFailureHandler alloc] init];

        head =  xctestHandler;
        xctestHandler.successor = ocunitHandler;
        ocunitHandler.successor = genericHandler;
    }
    return head;
}

@end
