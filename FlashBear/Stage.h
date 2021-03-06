//
//  Stage.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bear.h"
#import "SoundPlayer.h"

@interface Stage : NSObject

- (void)loop;
- (void)zapLoop;
- (void)bearLoop;
- (void)scoreLoop;

- (Bear *)bear;
- (UIViewController *)vc;

- (void)activate;

- (void)touchBegan;

- (UIView *)view;

- (SoundPlayer *)soundPlayer;

@end
