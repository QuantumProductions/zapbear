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
    lightningDelay = arc4random() % 400;
    lightningDelay += 40;
    
    if (lightningDelay > 300) {
        int r = arc4random() % 3;
        
        if (r == 0) {
            lightningDelay -= 200;
        } else if (r == 1) {
            lightningDelay-= 150;
        }
    }
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)zapLoop {
    lightningDelay--;
    if (lightningDelay <= 0) {
        [[Field shared] showLightning];
    }
}

@end
