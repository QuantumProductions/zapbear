//
//  RedLightning.m
//  FlashBear
//
//  Created by quantum on 29/09/2017.
//  Copyright © 2017 Quantum Productions. All rights reserved.
//

#import "RedLightning.h"

@implementation RedLightning

- (void)incrementIterations {
    [super incrementIterations];
    if (iterations == 6) {
        strikingLeft = !strikingLeft;
    }
}

- (void)assignColor:(CGContextRef)context {
    CGContextSetRGBStrokeColor(context, 1.0, 0.769, 0.196, 1.0);
}

- (bool)advanced {
    return true;
}

@end
