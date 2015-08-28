//
//  UIViewController+ArbitraryAds.m
//  FlashBear
//
//  Created by quantum on 24/08/2015.
//  Copyright (c) 2015 Quantum Productions. All rights reserved.
//

#import "UIViewController+ArbitraryAds.h"
#import <objc/runtime.h>

NSString const *key = @"arbitrary.ads";

@implementation UIViewController (ArbitraryAds)


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"error: %@", error);
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner {
    return true;
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    return true;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
}

- (void)bannerViewWillLoadAd:(ADBannerView *)banner {
    
}

- (void)loadMoney {
    if (!self.arbitrary) {
        CGSize size = [[UIScreen mainScreen] bounds].size;
        self.arbitrary = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        self.arbitrary.frame = CGRectMake(0, size.height - 44, size.width, 44);
        [self.view addSubview:self.arbitrary];
        self.arbitrary.delegate = self;
        self.arbitrary.alpha = 1;
    } else {
        self.arbitrary.alpha = 1;
    }
}

- (void)hideMoney {
    self.arbitrary.alpha = 0;
}

- (void)setArbitrary:(ADBannerView *)arbitrary {
    objc_setAssociatedObject(self, &key, arbitrary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)arbitrary {
    return objc_getAssociatedObject(self, &key);
}


@end
