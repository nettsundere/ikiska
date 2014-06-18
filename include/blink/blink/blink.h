#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface blink : NSObject
+ (float) getBrightnessOf:(int) displayNumber;
+ (void)  setBrightnessOf:(int) displayNumber to:(float) newLevel;
@end
