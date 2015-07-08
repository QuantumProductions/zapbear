//
//  ViewController.h
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Menu.h"
#import "Lightning.h"
#import <GameKit/GameKit.h>
#import <iAD/iAD.h>

typedef enum : NSUInteger {
    Title,
    Ready,
    Storm,
    ThunderStruck
} GameState;
@interface ViewController : UIViewController <MenuDelegate, GKGameCenterControllerDelegate, ADBannerViewDelegate>
{
    int accumulationDelay;
    NSInteger displayTotal;
    
    CGPoint startFlash;
    CGPoint startBear;
    
    bool onLeftSide;
    bool bearIsGrounded;
    int jumpForce;
    float gravity;
    float fallSpeed;
    float xPosEpsilon;
    float xMoveInverseAcceleration;
    bool isInXPlace;
    
    bool bearHasBeenHitOnce;
    
    CGSize size;
    
    int lightningDelay;
    int framesUntilLightningStrike;
    
    bool dodged;
    
    int points;
    
    int lightnings;
    
    NSInteger best;
    
    int lastLightningDelay;
    
    GameState state;
    
    float bearScale;
}

@property (strong, nonatomic) IBOutlet UIImageView *bear;

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *highscoreLabel;
@property (strong, nonatomic) UILabel *bestLabel;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) AVAudioPlayer *musicPlayer;

@property (strong, nonatomic) AVAudioPlayer *thunderPlayer;
@property (strong, nonatomic) AVAudioPlayer *thunder2Player;
@property (strong, nonatomic) AVAudioPlayer *lightningPlayer;

@property (strong, nonatomic) Menu *menu;

@property (strong, nonatomic) Lightning *lightning;

@property (strong, nonatomic) IBOutlet UILabel *flashTitle;
@property (strong, nonatomic) IBOutlet UILabel *bearTitle;

@property (strong, nonatomic) UIImageView *bg;

@property (strong, nonatomic) NSArray *scoresToReport;

@property (strong, nonatomic) ADBannerView *arbitrary;

@end
