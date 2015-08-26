//
//  Lightning.h
//  FlashBear
//
//  Created by quantum on 29/06/2015.
//  CopyrighT (c) 2015 Quantum Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Field;

@interface Lightning : UIView {
    int iterations;
    CGPoint bolts[34];
    float drawWidth;
    bool strikingLeft;
}

@property (nonatomic) float x;
@property (nonatomic, assign) Field *f;

- (void)strike;

- (bool)onLeft;
- (bool)struck;

- (id)initWithFrame:(CGRect)frame field:(Field *)f;

- (CGPoint)latest;

@end
