//
//  FlashStage.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "FlashStage.h"
#import "Field.h"

@implementation FlashStage

- (void)activate {
    self.view.backgroundColor = [UIColor whiteColor];
    flash = 8;
}

- (void)zapLoop {
    flash--;
    if (flash == 0) {
        [self.f showZap];
    }
}

@end
