//
//  AppDelegate.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateManager.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate> {
    UpdateManager* manager;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
