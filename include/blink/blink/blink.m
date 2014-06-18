#import "blink.h"

@implementation blink

// Get brightness of display by its number.
//
+ (float) getBrightnessOf:(int) displayNumber {
    io_iterator_t ioIterator;
    kern_return_t result = IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &ioIterator);
    if(result == kIOReturnSuccess) {
        io_object_t display;
        int currentDisplay = 0;
        
        while((display = IOIteratorNext(ioIterator))) {
            @try {
                if(displayNumber == currentDisplay) {
                    float brightness;
                    result = IODisplayGetFloatParameter(display, kNilOptions, CFSTR(kIODisplayBrightnessKey), &brightness);
                    if(result == kIOReturnSuccess) {
                        return brightness;
                    }
                }
                
                currentDisplay++;
            }
            @finally {
                IOObjectRelease(display);
            }
        }
    }
    
    return -1;
}

// Set brightness of all displays to specified value.
//
+ (void) setBrightnessOf:(int) displayNumber to:(float) newLevel {
    io_iterator_t ioIterator;
    kern_return_t result = IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &ioIterator);
    if(result == kIOReturnSuccess) {
        io_object_t display;
        int currentDisplay = 0;
        
        while((display = IOIteratorNext(ioIterator))) {
            @try {
                if(displayNumber == currentDisplay) {
                    IODisplaySetFloatParameter(display, kNilOptions, CFSTR(kIODisplayBrightnessKey), newLevel);
                    return;
                }
                
                currentDisplay++;
            }
            @finally {
                IOObjectRelease(display);
            }
        }
    }
    
    return;
}


@end
