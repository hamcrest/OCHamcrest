#import <OCHamcrest/HCDescription.h>
#import "HCValueMatcher.h"

@implementation HCValueMatcher

+ (id)isEqualToPoint:(NSPoint)targetPoint {
    return [[[self alloc] initWithPoint:targetPoint] autorelease];
}

- (id)initWithPoint:(NSPoint)targetPoint {
    if ((self = [super init])) {
        _value = [NSValue value:&targetPoint withObjCType:@encode(NSPoint)];
    }

    return self;
}

+ (id)isEqualToSize:(NSSize)targetSize mode:(SizeMatchMode)mode {
    return [[[self alloc] initWithSize:targetSize mode:mode] autorelease];
}

- (id)initWithSize:(NSSize)targetSize mode:(SizeMatchMode)aMode {
    if ((self = [super init])) {
        _value = [NSValue valueWithBytes:&targetSize objCType:@encode(NSSize)];
        _mode = aMode;
    }

    return self;
}

+ (id)isEqualToRect:(NSRect)targetRect {
    return [[[self alloc] initWithRect:targetRect] autorelease];
}

- (id)initWithRect:(NSRect)aRect {
    if ((self = [super init])) {
        _value = [NSValue valueWithBytes:&aRect objCType:@encode(NSRect)];
    }

    return self;
}

+ (id)isEqualToRange:(NSRange)targetRange {
    return [[[self alloc] initWithRange:targetRange] autorelease];
}

- (id)initWithRange:(NSRange)targetRange {
    if ((self = [super init])) {
        _value = [NSValue valueWithBytes:&targetRange objCType:@encode(NSRange)];
    }

    return self;
}

- (BOOL)matches:(id)item {
    if (![item isKindOfClass:[NSValue class]]) {
        return NO;
    }

    if (strcmp([_value objCType], @encode(NSSize)) != 0) {
        return [_value isEqualToValue:item];
    }

    if (strcmp([_value objCType], @encode(NSSize)) == 0) {
        if (strcmp([item objCType], @encode(NSSize))) {
            return NO;
        }

        NSSize targetSize = [_value sizeValue];
        NSSize sourceSize = [item sizeValue];

        switch (_mode) {
            case SMALLER:
                if (sourceSize.width <= targetSize.width && sourceSize.height < targetSize.height) {
                    return YES;
                }

                if (sourceSize.width < targetSize.width && sourceSize.height <= targetSize.height) {
                    return YES;
                }

            case SAME:
                return [_value isEqualToValue:item];

            case BIGGER:
                if (sourceSize.width >= targetSize.width && sourceSize.height > targetSize.height) {
                    return YES;
                }

                if (sourceSize.width > targetSize.width && sourceSize.height >= targetSize.height) {
                    return YES;
                }
        }
    }

    return NO;
}

- (void)describeTo:(id <HCDescription>)description {
    NSString *desc = nil;

    if (strcmp([_value objCType], @encode(NSSize)) == 0) {
        switch (_mode) {
            case SMALLER:
                desc = [NSString stringWithFormat:@"smaller NSSize %@", _value];
                break;

            case SAME:
                desc = _value.description;
                break;

            case BIGGER:
                desc = [NSString stringWithFormat:@"bigger NSSize %@", _value];
                break;
        }
    } else {
        desc = [NSString stringWithFormat:@"value equal to %@", _value];
    }

    [description appendText:desc];
}

@end

id<HCMatcher> equalToPoint(NSPoint targetPoint) {
    return [HCValueMatcher isEqualToPoint:targetPoint];
}
id<HCMatcher> equalToSize(NSSize targetSize) {
    return [HCValueMatcher isEqualToSize:targetSize mode:SAME];
}
id<HCMatcher> smallerThanSize(NSSize targetSize) {
    return [HCValueMatcher isEqualToSize:targetSize mode:SMALLER];
}
id<HCMatcher> biggerThanSize(NSSize targetSize) {
    return [HCValueMatcher isEqualToSize:targetSize mode:BIGGER];
}
id<HCMatcher> equalToRect(NSRect targetRect) {
    return [HCValueMatcher isEqualToRect:targetRect];
}
id<HCMatcher> equalToRange(NSRange targetRange) {
    return [HCValueMatcher isEqualToRange:targetRange];
}

