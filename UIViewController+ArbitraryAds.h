//
//  UIViewController+ArbitraryAds.h
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAD/iAD.h>

@interface UIViewController (ArbitraryAds)

- (void)bannerView:(ADBannerView *)banner;
- (void)bannerViewActionDidFinish:(ADBannerView *)banner;
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner;
- (void)bannerViewDidLoadAd:(ADBannerView *)banner;
- (void)bannerViewWillLoadAd:(ADBannerView *)banner;
- (void)loadMoney;

@property (strong, nonatomic) ADBannerView *arbitrary;

@end
