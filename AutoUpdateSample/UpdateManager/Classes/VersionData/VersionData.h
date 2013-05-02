//
//  VersionData.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VersionData <NSObject>

- (BOOL)isUpdateWithVersion:(int)version;

@end


