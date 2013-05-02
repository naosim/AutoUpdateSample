//
//  ManifestChekerTest.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "UpdateChekerTest.h"
#import "ServerData.h"
#import "AsyncURLConnectionMock.h"
#import "OriginalVersionData.h"

@interface VersionDataMock : NSObject<VersionData> {
    int currentVersion;
}
- (id)initWithCurrentVersion:(int)version;
@end

@implementation VersionDataMock
- (id)initWithCurrentVersion:(int)version {
    if(self = [super init]) {
        currentVersion = version;
    }
    return self;
}

- (BOOL)isUpdateWithVersion:(int)version {
    return currentVersion < version;
}
@end

@implementation UpdateChekerTest

- (void)test_SuccessConnection_HasUpdate {
    ServerData* serverData = [ServerData new];
    AsyncURLConnection* conn = [[AsyncURLConnectionMock alloc] initWithResponseStrData:@"2"];
    id<VersionData> versionData = [[VersionDataMock alloc] initWithCurrentVersion:1];
    
    UpdateCheker* cheker = [[UpdateCheker alloc] initWithURL:serverData.versionDataUrl versionData:versionData asyncURLConnection:conn];
    [cheker checkUpdate:[self assertBool:YES message:@"通信が成功しバージョンアップがあった場合、YESを返す"]];
    
}

- (void)test_SuccessConnection_NoUpdate {
    ServerData* serverData = [ServerData new];
    AsyncURLConnection* conn = [[AsyncURLConnectionMock alloc] initWithResponseStrData:@"1"];
    id<VersionData> versionData = [[VersionDataMock alloc] initWithCurrentVersion:1];
    
    UpdateCheker* cheker = [[UpdateCheker alloc] initWithURL:serverData.versionDataUrl versionData:versionData asyncURLConnection:conn];
    [cheker checkUpdate:[self assertBool:NO message:@"通信が成功しバージョンアップが無かった場合、NOを返す"]];
}

- (void)test_SuccessConnection_WrrongData {
    ServerData* serverData = [ServerData new];
    AsyncURLConnection* conn = [[AsyncURLConnectionMock alloc] initWithResponseStrData:@"hogehoge"];
    id<VersionData> versionData = [[VersionDataMock alloc] initWithCurrentVersion:1];
    
    UpdateCheker* cheker = [[UpdateCheker alloc] initWithURL:serverData.versionDataUrl versionData:versionData asyncURLConnection:conn];
    [cheker checkUpdate:[self assertBool:NO message:@"通信が成功したがバージョンアップ用のデータが不正だった場合、NOを返す"]];
}

- (void)test_FailedConnection {
    ServerData* serverData = [ServerData new];
    AsyncURLConnection* conn = [[AsyncURLConnectionMock alloc] initForOffline];
    id<VersionData> versionData = [[VersionDataMock alloc] initWithCurrentVersion:1];
    
    UpdateCheker* cheker = [[UpdateCheker alloc] initWithURL:serverData.versionDataUrl versionData:versionData asyncURLConnection:conn];
    [cheker checkUpdate:[self assertBool:NO message:@"通信が失敗した場合、NOを返す"]];
}

- (ResultBlocks)assertBool:(BOOL)exp message:(NSString*)message {
    ResultBlocks result = ^(BOOL result) {
        if(exp) {
            STAssertTrue(result, message);
        } else {
            STAssertFalse(result, message);
        }
    };
    return result;
}



@end
