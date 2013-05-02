//
//  UpdateManger.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "UpdateManager.h"
#import "OriginalVersionData.h"

@implementation UpdateManager

#define UPDATE_MANIFEST_URL (@"http://localhost")

- (id)init {
    if(self = [super init]) {
        manifestChecker = [[ManifestCheker alloc] initWithURL:UPDATE_MANIFEST_URL versionData:OriginalVersionData.new asyncURLConnection:AsyncURLConnection.new];
    }
    return self;
}

- (BOOL)isUpate {
    return NO;
}
- (void)checkUpdate:(void(^)(BOOL result))blocks {
}

- (void)startUpdate:(void(^)(BOOL result))blocks {
    
}

@end
