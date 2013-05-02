//
//  UpdateManger.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VersionData.h"
#import "UpdateCheker.h"
#import "FileDwonloader.h"
#import "ServerData.h"

/// アップデートまわりのファサード
@interface UpdateManager : NSObject {
    UpdateCheker* manifestChecker;
    FileDwonloader* fileDownloader;
    SimpleFileManager* simpleFileManager;
    ClientData* clientData;
}
- (id)initWithServerData:(ServerData*)serverData ClientData:(ClientData*)clientData;

- (void)setupFirstLunchIfNeed;

/// アップデートがあるかどうかチェックする
- (void)checkUpdate:(void(^)(BOOL result))blocks;
/// バイナリデータをDLする
- (void)startDownloadNewBinary:(void(^)(BOOL result))blocks;
/// バイナリデータのDLが完了しているかどうか
- (BOOL)isReadyForUpate;
/// アップデート開始
- (void)update;
@end
