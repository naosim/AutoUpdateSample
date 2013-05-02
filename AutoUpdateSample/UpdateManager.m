//
//  UpdateManger.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "UpdateManager.h"
#import "AppVersionData.h"
#import "OriginalVersionData.h"
#import "ServerData.h"

@implementation UpdateManager

- (id)init {
    if(self = [super init]) {
        manifestChecker = [[UpdateCheker alloc] initWithURL:ServerData.new.versionDataUrl
                                                versionData:AppVersionData.new
                                         asyncURLConnection:AsyncURLConnection.new];
    }
    return self;
}

- (void)checkUpdate:(void(^)(BOOL result))blocks {
    [manifestChecker checkUpdate:blocks];
}

- (void)startUpdate:(void(^)(BOOL result))blocks {
    
}

- (BOOL)isReadyForUpate {
    return NO;
}


@end
