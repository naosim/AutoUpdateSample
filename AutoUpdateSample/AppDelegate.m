//
//  AppDelegate.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self update];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)update {
    manager = [[UpdateManager alloc] initWithServerData:ServerData.new ClientData:ClientData.new];
    
    // 初回起動時に表示するhtmlをセットアップする
    [manager setupFirstLunchIfNeed];
    
    // アップデートが開始できる状態か?
    if([manager isReadyForUpate]) {
        // アップデート開始
        [manager update];
        [[[UIAlertView alloc] initWithTitle:@"result" message:@"ready" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil] show];
    } else {
        // アップデートがあるかどうかサーバに確認
        [manager checkUpdate:^(BOOL result) {
            if(!result) return;
            
            // アップデートがある場合、バイナリデータをDLする
            [manager startDownloadNewBinary:^(BOOL result) {
                if(!result) return;
                
                // UPDATEするかどうかのダイアログを表示する
                [self performSelectorOnMainThread:@selector(showUpdateNowDialog) withObject:nil waitUntilDone:NO];
            }];
        }];
    }

}

- (void)showUpdateNowDialog {
    [[[UIAlertView alloc] initWithTitle:@"result" message:@"update now?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil] show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == alertView.cancelButtonIndex) return;
    
    [manager update];
    [self.viewController reload];
}

- (void)showAlertWithBool:(NSNumber*)boolNumber {
    [[[UIAlertView alloc] initWithTitle:@"result" message:[NSString stringWithFormat:@"%@", [boolNumber boolValue] ? @"Update!" : @"none update."] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil] show];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
