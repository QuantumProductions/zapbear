//
//  GreenLightning.m
//  FlashBear
//
//  Created by quantum on 10/09/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "GreenLightning.h"

@implementation GreenLightning

- (void)incrementIterations {
    [super incrementIterations];
    float w = self.frame.size.width;
    float lx = [self latest].x;
    if (lx < 1/3 * w || lx > 2/3 * w) {
        strikingLeft = !strikingLeft;
    }
}

- (void)assignColor:(CGContextRef)context {
    CGContextSetRGBStrokeColor(context, 0.2, 1, 0.1, 1.0);
}

- (bool)adroit {
    return true;
}

@end
