//
//  FlashStage.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "Stage.h"

@interface FlashStage : Stage {
    int flash;
}

- (void)flashBackground;

- (int)flashDelay;

- (NSString *)noteName;

@end
