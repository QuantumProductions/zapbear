//
//  Stage.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Field;
#import "Bear.h"

@interface Stage : NSObject

@property (nonatomic, assign) Field *f;

- (void)loop;
- (void)zapLoop;
- (void)bearLoop;

- (id)initWithField:(Field *)field;

- (Bear *)bear;
- (UIViewController *)vc;

- (void)activate;

- (void)touchBegan;

- (UIView *)view;

@end
