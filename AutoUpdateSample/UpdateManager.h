//
//  UpdateManger.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VersionData.h"
#import "ManifestCheker.h"
/// アップデートまわりのファサード
@interface UpdateManager : NSObject {
    ManifestCheker* manifestChecker;
}
- (BOOL)isUpate;
- (void)checkUpdate:(void(^)(BOOL result))blocks;
- (void)startUpdate:(void(^)(BOOL result))blocks;
@end
