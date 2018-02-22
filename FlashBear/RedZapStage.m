//
//  RedZapStage.m
//  FlashBear
//
//  Created by quantum on 29/09/2017.
//  Copyright © 2017 Quantum Productions. All rights reserved.
//

#import "RedZapStage.h"
#import "RedLightning.h"

@implementation RedZapStage

- (void)createLightning {
    self.lightning = [[RedLightning alloc] initWithFrame:self.view.frame];
}

@end
