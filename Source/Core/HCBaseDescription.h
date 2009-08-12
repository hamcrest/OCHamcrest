//
//  OCHamcrest - HCBaseDescription.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import <Foundation/Foundation.h>
#import <OCHamcrest/HCDescription.h>


/**
    Base class for all HCDescription implementations.
*/
@interface HCBaseDescription : NSObject<HCDescription>
@end


@interface HCBaseDescription (SubclassMustImplement)
- (void) append:(NSString*)string;
@end
