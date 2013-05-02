//
//  AppVersionData.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "AppVersionData.h"

@implementation AppVersionData
- (BOOL)isUpdateWithVersion:(int)version {
    int currentVersion =  [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] integerValue];
    return currentVersion < version;
}
@end
