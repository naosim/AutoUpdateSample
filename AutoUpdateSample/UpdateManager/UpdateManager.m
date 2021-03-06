//
//  UpdateManger.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "UpdateManager.h"
#import "AppVersionData.h"
#import "AsyncURLConnection.h"
#import "ZipArchive.h"
@implementation UpdateManager

- (id)initWithServerData:(ServerData*)serverData ClientData:(ClientData*)inclientData {
    if(self = [super init]) {
        clientData = inclientData;
        versionData = [[OriginalVersionData alloc] initWithUserDefaults:[NSUserDefaults standardUserDefaults]];
        simpleFileManager = [[SimpleFileManager alloc] initWithFileManager:[NSFileManager defaultManager]];
        manifestChecker = [[UpdateCheker alloc] initWithURL:serverData.versionDataUrl
                                                versionData:versionData
                                         asyncURLConnection:AsyncURLConnection.new];
        
        fileDownloader = [[FileDwonloader alloc] initWithURL:serverData.updateDataUrl
                                                   directory:clientData.dlPath
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
    return [simpleFileManager.fileManager fileExistsAtPath:clientData.zipPath];
}

- (void)update {
    [self unzipToHtmlFromZip:clientData.zipPath];
    [simpleFileManager clearDirectory:clientData.dlPath];
    [self updateVsersion];
}

- (void)updateVsersion {
    int version = [[NSString stringWithContentsOfFile:clientData.versionPath encoding:NSUTF8StringEncoding error:nil] integerValue];
    [versionData setVersion:version];
}

- (void)setupFirstLunchIfNeed {
    if(![self isFirstLunch]) return;
    NSString* zipPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/update.zip"];
    [self unzipToHtmlFromZip:zipPath];
    
}


- (void)unzipToHtmlFromZip:(NSString*)zipPath {
    [simpleFileManager clearDirectory:clientData.htmlPath];
    ZipArchive* za = [[ZipArchive alloc] init];
    if([za UnzipOpenFile:zipPath]) {
        BOOL ret = [za UnzipFileTo:clientData.htmlPath overWrite:YES];
        if(NO == ret) {
        }
        [za UnzipCloseFile];
    }
}

- (BOOL)isFirstLunch {
    // htmlのパスが空っぽかどうかで判別
    return ![simpleFileManager.fileManager fileExistsAtPath:clientData.htmlPath];
}

@end
