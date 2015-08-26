//
//  StormStage.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "StormStage.h"
#import "Field.h"

@implementation StormStage

- (void)activate {
    lightningDelay = arc4random() % 500;
    lightningDelay += 80;
    lastLightningDelay = lightningDelay;
    lightningDelay = 80;
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)zapLoop {
    lightningDelay--;
    if (lightningDelay <= 0) {
        [self.f showLightning];
    }
}

@end
