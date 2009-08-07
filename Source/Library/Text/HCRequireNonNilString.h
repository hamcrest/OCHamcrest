#import <Foundation/Foundation.h>


namespace hamstring {

inline
void requireNonNilString(NSString* string)
{
    if (string == nil)
    {
        @throw [NSException exceptionWithName: @"NotAString"
                                       reason: @"Must be non-nil string"
                                     userInfo: nil];
    }
}

}   // namespace hamstring
