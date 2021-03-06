//
//  ManifestCheker.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VersionData.h"
#import "AsyncURLConnection.h"
#import "ResultBlocks.h"

/// Check update on the web.
@interface UpdateCheker : NSObject {
    NSURL* url;
    NSObject<VersionData>* versionData;
    __block ResultBlocks resultBlocks;
    AsyncURLConnection* conn;
}

- (id)initWithURL:(NSString*)url versionData:(NSObject<VersionData>*)versionData asyncURLConnection:(AsyncURLConnection*)conn;
- (void)checkUpdate:(ResultBlocks)blocks;
@end
