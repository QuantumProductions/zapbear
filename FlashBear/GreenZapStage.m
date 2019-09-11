//
//  GreenZapStage.m
//  FlashBear
//
//  Created by quantum on 10/09/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "GreenZapStage.h"
#import "GreenLightning.h"

@implementation GreenZapStage

- (void)createLightning {
    self.lightning = [[GreenLightning alloc] initWithFrame:self.view.frame];
}

@end
