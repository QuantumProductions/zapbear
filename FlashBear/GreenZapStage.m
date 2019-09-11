//
//  GreenZapStage.m
//  FlashBear
//
//  Created by quantum on 10/09/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "GreenZapStage.h"
#import "BlueLightning.h"

@implementation GreenZapStage

- (void)createLightning {
    self.lightning = [[BlueLightning alloc] initWithFrame:self.view.frame];
}

@end
