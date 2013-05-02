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

typedef void (^ResultBlocks)(BOOL result);

/// Check update on the web.
@interface UpdateCheker : NSObject {
    NSURL* url;
    NSObject<VersionData>* versionData;
    __block ResultBlocks resultBlocks;
    AsyncURLConnection* conn;
}
/**
 
 */
- (id)initWithURL:(NSString*)url versionData:(NSObject<VersionData>*)versionData asyncURLConnection:(AsyncURLConnection*)conn;

// アップデートのチェックを開始する。アップデートがあったらブロックスでYESを渡す。
- (void)checkUpdate:(ResultBlocks)blocks;
@end
