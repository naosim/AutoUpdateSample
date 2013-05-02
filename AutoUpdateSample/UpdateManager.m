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
#import "ZipArchive.h"
@implementation UpdateManager

#define ZIP_PATH [APPLICATION_TMP_DIR stringByAppendingString:@"/update.zip"]
#define HTML_PATH [APPLICATION_DOC_DIR stringByAppendingString:@"/html"]

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
    return [simpleFileManager.fileManager fileExistsAtPath:ZIP_PATH];
}

- (void)update {
    [simpleFileManager clearDirectory:HTML_PATH];
    ZipArchive* za = [[ZipArchive alloc] init];
    if([za UnzipOpenFile:ZIP_PATH]) {
        BOOL ret = [za UnzipFileTo:HTML_PATH overWrite:YES];
        if(NO == ret) {
            // エラー処理
        }
        [za UnzipCloseFile];
    }
    
    [simpleFileManager clearDirectory:APPLICATION_TMP_DIR];
}
@end
