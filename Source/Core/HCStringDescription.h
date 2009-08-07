#import <hamcrest/HCBaseDescription.h>

@protocol HCSelfDescribing;


/**
    An HCDescription that is stored as a string.
*/
@interface HCStringDescription : HCBaseDescription
{
    NSMutableString* accumulator;
}

/**
    Returns the description of an HCSelfDescribing object as a string.

    @param selfDescribing The object to be described.
    @return The description of the object.
*/
+ (NSString*) stringFrom:(id<HCSelfDescribing>)selfDescribing;

+ (HCStringDescription*) stringDescription;

- (id) init;

@end
