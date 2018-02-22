//
//  ThunderStruck.h
//  FlashBear
//
//  Created by quantum on 26/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "Stage.h"
#import "Lightning.h"

@interface ThunderStruck : Stage {
    bool ready;
}

- (id)initWithLightning:(Lightning *)l;

- (void)announceHit;

- (NSString *)noteName;

@end
