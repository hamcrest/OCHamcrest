#import <Foundation/Foundation.h>

@protocol HCSelfDescribing;


/**
    A description of an HCMatcher.
    
    An HCMatcher will describe itself to a description which can later be used for reporting.
*/
@protocol HCDescription

/**
    Appends some plain text to the description.
    
    @return self
*/
- (id<HCDescription>) appendText:(NSString*)text;

/**
    Appends description of HCSelfDescribing value to self.
    
    @return self
*/
- (id<HCDescription>) appendDescriptionOf:(id<HCSelfDescribing>)value;

/**
    Appends an arbitary value to the description.
*/
- (id<HCDescription>) appendValue:(id)value;

/** 
    Appends a list of objects to the description.
*/
- (id<HCDescription>) appendList:(NSArray*)values
                        start:(NSString*)start separator:(NSString*)separator end:(NSString*)end;

@end
