//
//  ClientData.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClientData : NSObject
@property (weak, nonatomic, readonly)NSString* zipPath;
@property (weak, nonatomic, readonly)NSString* dlPath;

@property (weak, nonatomic, readonly)NSString* htmlPath;
@property (weak, nonatomic, readonly)NSString* indexHtmlPath;
@property (weak, nonatomic, readonly)NSString* versionPath;
@end
