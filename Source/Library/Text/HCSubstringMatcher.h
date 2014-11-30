//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import <OCHamcrest/HCBaseMatcher.h>


@interface HCSubstringMatcher : HCBaseMatcher

@property (readonly, nonatomic, copy) NSString *substring;

- (instancetype)initWithSubstring:(NSString *)aString;

@end
