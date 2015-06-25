//
//  ViewController.h
//  FlashBear
//
//  Created by Paul Muren on 6/25/15.
//  Copyright (c) 2015 Paul Muren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //LEFT side is false, RIGHT side is true
    bool side;
    
}

@property (strong, nonatomic) IBOutlet UIView *bear;



@end
