//
//  UpdateManger.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "UpdateManager.h"
#import "OriginalVersionData.h"
#import "ServerData.h"

@implementation UpdateManager

- (id)init {
    if(self = [super init]) {
        manifestChecker = [[UpdateCheker alloc] initWithURL:ServerData.new.versionDataUrl
                                                versionData:OriginalVersionData.new
                                         asyncURLConnection:AsyncURLConnection.new];
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
