#import <XCTest/XCTest.h>
#import "blink.h"

@interface blinkTests : XCTestCase

@end

@implementation blinkTests {
    float _initialBrightness;
}

- (void) setUp {
    [super setUp];
    _initialBrightness = [blink getBrightnessOf:0];
    sleep(1);
}

- (void) tearDown {
    [super tearDown];
    sleep(1);
    [blink setBrightnessOf:0 to:_initialBrightness];
}

- (void) testCanGetBrightness {
    float currentBrightness = [blink getBrightnessOf:0];
    XCTAssert(currentBrightness >= 0 && currentBrightness <= 1);
}

- (void) testCanSetBrightness {
    float newBrightness = 0.5;
    [blink setBrightnessOf:0 to:newBrightness];
    sleep(1);
    float currentBrightness = [blink getBrightnessOf:0];
    XCTAssertEqualWithAccuracy(newBrightness, currentBrightness, 0.2);
}

@end
