//
//  ServerData.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerData : NSObject
@property (weak, nonatomic, readonly)NSString* versionDataUrl;
@property (weak, nonatomic, readonly)NSString* updateDataUrl;
@end
