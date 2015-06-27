//
//  ViewController.h
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    //LEFT side is false, RIGHT side is true
    bool side;
    bool bearIsGrounded;
    int jumpForce;
    float gravity;
    float fallSpeed;
    float xPosEpsilon;
    float xMoveInverseAcceleration;
    bool isInXPlace;
    
    CGSize size;
    
    int lightningDelay;
    int framesUntilLightningStrike;
    
    bool dodged;
    
    int points;
}

@property (strong, nonatomic) IBOutlet UIView *bear;

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
