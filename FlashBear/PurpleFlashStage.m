//
//  PurpleFlashStage.m
//  FlashBear
//
//  Created by quantum on 09/09/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "PurpleFlashStage.h"

@implementation PurpleFlashStage

- (int)flashDelay {
    return 30;
}

- (void)flashBackground {
    self.view.backgroundColor = [UIColor purpleColor];
}

- (NSString *)noteName {
    return @"hidepurplebg";
}

@end
