//
//  BlueFlashStage.m
//  FlashBear
//
//  Created by quantum on 28/05/2019.
//  Copyright © 2019 Quantum Productions. All rights reserved.
//

#import "BlueFlashStage.h"

@implementation BlueFlashStage

- (int)flashDelay {
    return 30;
}

- (void)flashBackground {
    self.view.backgroundColor = [UIColor blueColor];
}

- (NSString *)noteName {
    return @"hidebluebg";
}

@end
