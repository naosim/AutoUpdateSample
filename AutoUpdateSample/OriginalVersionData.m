//
//  OriginalVersionData.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "OriginalVersionData.h"

@implementation OriginalVersionData
#define KEY_ORIGINAL_VERSION @"KEY_ORIGINAL_VERSION"

- (id)initWithUserDefaults:(NSUserDefaults*)inuserDefaults {
    if(self = [super init]) {
        userDefaults = inuserDefaults;
    }
    return self;
}

- (BOOL)isUpdateWithVersion:(int)version {
    int currentVersion = [userDefaults integerForKey:KEY_ORIGINAL_VERSION];
    return currentVersion < version;
}

- (void)setVersion:(int)version {
    [userDefaults setInteger:version forKey:KEY_ORIGINAL_VERSION];
    [userDefaults synchronize];
}

@end
