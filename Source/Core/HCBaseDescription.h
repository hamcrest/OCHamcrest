#import <Foundation/Foundation.h>
#import <hamcrest/HCDescription.h>


/**
    Base class for all HCDescription implementations.
*/
@interface HCBaseDescription : NSObject<HCDescription>
@end


@interface HCBaseDescription (SubclassMustImplement)
- (void) append:(NSString*)string;
@end
