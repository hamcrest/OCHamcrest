//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 hamcrest.org. See LICENSE.txt

#import "HCIsAnything.h"


@implementation HCIsAnything
{
    NSString *_description;
}

+ (instancetype)isAnything
{
    return [[self alloc] init];
}

+ (instancetype)isAnythingWithDescription:(NSString *)description
{
    return [[self alloc] initWithDescription:description];
}

- (instancetype)init
{
    self = [self initWithDescription:@"ANYTHING"];
    return self;
}

- (instancetype)initWithDescription:(NSString *)description
{
    self = [super init];
    if (self)
        _description = [description copy];
    return self;
}

- (BOOL)matches:(id)item
{
    return YES;
}

- (void)describeTo:(id <HCDescription>)aDescription
{
    [aDescription appendText:_description];
}

@end


id HC_anything()
{
    return [HCIsAnything isAnything];
}

id HC_anythingWithDescription(NSString *description)
{
    return [HCIsAnything isAnythingWithDescription:description];
}
