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
#import "AsyncURLConnection.h"
@implementation UpdateManager

- (id)init {
    if(self = [super init]) {
        ServerData* serverData = ServerData.new;
        simpleFileManager = [[SimpleFileManager alloc] initWithFileManager:[NSFileManager defaultManager]];
        manifestChecker = [[UpdateCheker alloc] initWithURL:serverData.versionDataUrl
                                                versionData:AppVersionData.new
                                         asyncURLConnection:AsyncURLConnection.new];
        
        fileDownloader = [[FileDwonloader alloc] initWithURL:serverData.updateDataUrl
                                                   directory:APPLICATION_TMP_DIR
                                           fileHandleFactory:simpleFileManager
                                          asyncURLConnection:AsyncURLConnection.new];
    }
    return self;
}

- (void)checkUpdate:(void(^)(BOOL result))blocks {
    [manifestChecker checkUpdate:blocks];
}

- (void)startDownloadNewBinary:(void(^)(BOOL result))blocks {
    [fileDownloader startWithBlocks:blocks];
}

- (BOOL)isReadyForUpate {
    return [simpleFileManager.fileManager fileExistsAtPath:[APPLICATION_TMP_DIR stringByAppendingString:@"/update.txt"]];
}

- (void)update {
    
}
@end
