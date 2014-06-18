#import "blink.h"

float getBrightness(int displayNumber) {
    return [blink getBrightnessOf:displayNumber];
}

void setBrightness(int displayNumber, float newValue) {
    [blink setBrightnessOf:displayNumber to:newValue];
}