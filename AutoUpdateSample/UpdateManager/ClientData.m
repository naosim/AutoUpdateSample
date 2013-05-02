//
//  ClientData.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "ClientData.h"

@implementation ClientData
- (NSString*)zipPath {
    return [APPLICATION_TMP_DIR stringByAppendingString:@"/update.zip"];
}

- (NSString*)dlPath {
    return APPLICATION_TMP_DIR;
}


- (NSString*)htmlPath {
    return [APPLICATION_DOC_DIR stringByAppendingString:@"/html"];
}

- (NSString*)indexHtmlPath {
    return [APPLICATION_DOC_DIR stringByAppendingString:@"/html/update.txt"];
}

- (NSString*)versionPath {
    return [APPLICATION_DOC_DIR stringByAppendingString:@"/html/version.txt"];
}

@end
