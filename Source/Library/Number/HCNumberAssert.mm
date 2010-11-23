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


#define DEFINE_NUMBER_ASSERT(name, type)                                                        \
    void HC_assertThat ## name ## WithLocation(id testCase, type actual, id<HCMatcher> matcher, \
                                                const char* fileName, int lineNumber)           \
    {                                                                                           \
        HC_assertThatWithLocation(testCase, boxNumber(actual), matcher, fileName, lineNumber);  \
    }


extern "C" {

DEFINE_NUMBER_ASSERT(Bool, BOOL)
DEFINE_NUMBER_ASSERT(Char, char)
DEFINE_NUMBER_ASSERT(Double, double)
DEFINE_NUMBER_ASSERT(Float, float)
DEFINE_NUMBER_ASSERT(Int, int)
DEFINE_NUMBER_ASSERT(Long, long)
DEFINE_NUMBER_ASSERT(LongLong, long long)
DEFINE_NUMBER_ASSERT(Short, short)
DEFINE_NUMBER_ASSERT(UnsignedChar, unsigned char)
DEFINE_NUMBER_ASSERT(UnsignedInt, unsigned int)
DEFINE_NUMBER_ASSERT(UnsignedLong, unsigned long)
DEFINE_NUMBER_ASSERT(UnsignedLongLong, unsigned long long)
DEFINE_NUMBER_ASSERT(UnsignedShort, unsigned short)
DEFINE_NUMBER_ASSERT(Integer, NSInteger)
DEFINE_NUMBER_ASSERT(UnsignedInteger, NSUInteger)

}   // extern "C"
