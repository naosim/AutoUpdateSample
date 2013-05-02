//
//  ServerData.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "ServerData.h"

@implementation ServerData
- (NSString*)versionDataUrl {
    return @"http://192.168.44.60/~nao_pillows/test/version.txt";
}

- (NSString*)updateDataUrl {
    return @"http://192.168.44.60/~nao_pillows/test/update.zip";
}
@end
