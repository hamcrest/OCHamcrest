#import <stdarg.h>
#import <Foundation/Foundation.h>

@protocol HCMatcher;


#ifdef __cplusplus
extern "C" {
#endif

NSMutableArray* HC_collectMatchers(id<HCMatcher> matcher, va_list args);

#ifdef __cplusplus
}
#endif
