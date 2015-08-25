//
//  ZapStage.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "Stage.h"
#import "Lightning.h"

@interface ZapStage : Stage {
    int afterImageFrames;
}

@property (strong, nonatomic) Lightning *lightning;


@end
