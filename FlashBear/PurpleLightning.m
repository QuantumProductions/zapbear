//
//  PurpleLightning.m
//  FlashBear
//
//  Created by quantum on 09/09/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "PurpleLightning.h"

@implementation PurpleLightning

- (void)incrementIterations {
    [super incrementIterations];
    if (iterations == 6) {
        strikingLeft = !strikingLeft;
    }
}

- (void)assignColor:(CGContextRef)context {
    CGContextSetRGBStrokeColor(context, 0.627, 0.29, 0.98, 1.0);
}

- (bool)adept {
    return true;
}

@end
