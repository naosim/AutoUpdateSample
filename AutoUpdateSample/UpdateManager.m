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

#define APPLICATION_TMP_DIR	[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"]

@implementation UpdateManager

- (id)init {
    if(self = [super init]) {
        ServerData* serverData = ServerData.new;
        manifestChecker = [[UpdateCheker alloc] initWithURL:serverData.versionDataUrl
                                                versionData:AppVersionData.new
                                         asyncURLConnection:AsyncURLConnection.new];
        fileDownloader = [[FileDwonloader alloc] initWithURL:serverData.updateDataUrl directory:APPLICATION_TMP_DIR];
    }
    return self;
}

- (void)checkUpdate:(void(^)(BOOL result))blocks {
    [manifestChecker checkUpdate:blocks];
}

- (void)startUpdate:(void(^)(BOOL result))blocks {
    [fileDownloader startWithBlocks:blocks];
}

- (BOOL)isReadyForUpate {
    return NO;
}


@end
