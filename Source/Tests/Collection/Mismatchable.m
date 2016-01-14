//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 hamcrest.org. See LICENSE.txt

#import "Mismatchable.h"


@interface Mismatchable ()
@property (nonatomic, copy, readonly) NSString *string;
@end

@implementation Mismatchable

+ (instancetype)mismatchable:(NSString *)string
{
    return [[self alloc] initMismatchableString:string];
}

- (instancetype)initMismatchableString:(NSString *)string
{
    self = [super init];
    if (self)
        _string = [string copy];
    return self;
}

- (BOOL)matches:(id)item
{
    return [self.string isEqualToString:item];
}

- (void)describeMismatchOf:(id)item to:(id <HCDescription>)mismatchDescription
{
    [[mismatchDescription appendText:@"mismatched: "] appendText:item];
}

- (void)describeTo:(id <HCDescription>)description
{
    [[description appendText:@"mismatchable: "] appendText:self.string];
}

@end
