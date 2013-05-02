//
//  OriginalVersionData.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VersionData.h"
@interface OriginalVersionData : NSObject<VersionData> {
    NSUserDefaults* userDefaults;
}
- (id)initWithUserDefaults:(NSUserDefaults*)userDefaults;
- (BOOL)isUpdateWithVersion:(int)version;
- (void)setVersion:(int)version;
@end
