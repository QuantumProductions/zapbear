//
//  RedFlashStage.m
//  FlashBear
//
//  Created by quantum on 29/09/2017.
//  Copyright © 2017 Quantum Productions. All rights reserved.
//

#import "RedFlashStage.h"

@implementation RedFlashStage

- (void)flashBackground {
    self.view.backgroundColor = [UIColor redColor];
}

- (NSString *)noteName {
    return @"hideredbg";
}


@end
