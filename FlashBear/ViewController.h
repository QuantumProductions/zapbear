//
//  ViewController.h
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  CopyrighT (c) 2015 Quantum Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Menu.h"
#import "Lightning.h"
#import "Field.h"
#import "UIViewController+ArbitraryAds.h"

typedef enum : NSUInteger {
    Title,
    Ready,
    Storm,
    ThunderStruck
} GameState;

@interface ViewController : UIViewController <MenuDelegate>
{
    int accumulationDelay;
    NSInteger displayTotal;
    
    CGPoint startFlash;
    CGPoint startBear;
    
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
    
    bool loaded;
}

@property (strong, nonatomic) UIImageView *bg;

@property (strong, nonatomic) Field *f;

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *highscoreLabel;
@property (strong, nonatomic) UILabel *bestLabel;

@property (strong, nonatomic) Menu *menu;

@property (strong, nonatomic) Lightning *lightning;

@end
