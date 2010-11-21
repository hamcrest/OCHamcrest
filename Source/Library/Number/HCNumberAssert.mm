//
//  OCHamcrest - HCNumberAssert.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCNumberAssert.h"

    // OCHamcrest
#import "HCBoxNumber.h"
#import "HCMatcherAssert.h"
using namespace hamcrest;


#define defineNumberAssert(name, type)                                                          \
    void HC_assertThat ## name ## WithLocation(id testCase, type actual, id<HCMatcher> matcher, \
                                                const char* fileName, int lineNumber)           \
    {                                                                                           \
        HC_assertThatWithLocation(testCase, boxNumber(actual), matcher, fileName, lineNumber);  \
    }


extern "C" {

defineNumberAssert(Bool, BOOL)
defineNumberAssert(Char, char)
defineNumberAssert(Double, double)
defineNumberAssert(Float, float)
defineNumberAssert(Int, int)
defineNumberAssert(Long, long)
defineNumberAssert(LongLong, long long)
defineNumberAssert(Short, short)
defineNumberAssert(UnsignedChar, unsigned char)
defineNumberAssert(UnsignedInt, unsigned int)
defineNumberAssert(UnsignedLong, unsigned long)
defineNumberAssert(UnsignedLongLong, unsigned long long)
defineNumberAssert(UnsignedShort, unsigned short)
defineNumberAssert(Integer, NSInteger)
defineNumberAssert(UnsignedInteger, NSUInteger)

}   // extern "C"
