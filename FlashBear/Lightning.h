//
//  Lightning.h
//  FlashBear
//
//  Created by quantum on 29/06/2015.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lightning : UIView {
    int iterations;
    CGPoint bolts[23];
}

@property (nonatomic) float x;

- (void)strike;

@end
