//
//  PurpleZapStage.m
//  FlashBear
//
//  Created by quantum on 09/09/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "PurpleZapStage.h"
#import "PurpleLightning.h"

@implementation PurpleZapStage

- (void)createLightning {
    self.lightning = [[PurpleLightning alloc] initWithFrame:self.view.frame];
}

@end
