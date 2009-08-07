#import "HCWrapShortcut.h"

#define HC_SHORTHAND
#import "HCIsEqual.h"


extern "C" {

id<HCMatcher> HC_wrapShortcut(id item)
{
    if ([item conformsToProtocol:@protocol(HCMatcher)])
        return item;
    else
        return equalTo(item);
}

}   // extern "C"
