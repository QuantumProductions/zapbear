//
//  BlueZapStage.m
//  FlashBear
//
//  Created by quantum on 28/05/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "BlueZapStage.h"
#import "BlueLightning.h"

@implementation BlueZapStage

- (void)createLightning {
    self.lightning = [[BlueLightning alloc] initWithFrame:self.view.frame];
}


@end
