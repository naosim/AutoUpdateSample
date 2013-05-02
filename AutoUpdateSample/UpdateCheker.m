//
//  ManifestCheker.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "UpdateCheker.h"

@implementation UpdateCheker
- (id)initWithURL:(NSString*)inurl versionData:(NSObject<VersionData>*)inversionData asyncURLConnection:(AsyncURLConnection*)inconn {
    if(self = [super init]) {
        url = [NSURL URLWithString:inurl];
        versionData = inversionData;
        conn = inconn;
    }
    return self;
}

- (void)checkUpdate:(ResultBlocks)blocks {
    if(resultBlocks != nil) return;
    
    resultBlocks = blocks;
    [conn sendAsynchronousRequest:[NSURLRequest requestWithURL:url] completionHandler:^(NSURLResponse *res, NSData *data, NSError *err) {
        if([self isManifestDownloadSuccessWithResponse:res data:data error:err]) {
            // 成功
            [self returnResult:[NSNumber numberWithBool:[self isUpdateWithData:data]]];
        } else {
            // 失敗
            [self returnResult:@NO];
        }
    }];
}

- (BOOL)isManifestDownloadSuccessWithResponse:(NSURLResponse*)res data:(NSData*)data error:(NSError*)err {
    return !(res == nil || data == nil || err != nil);
}

- (BOOL)isUpdateWithData:(NSData*)data {
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [versionData isUpdateWithVersion:[str integerValue]];
}

- (void)returnResult:(NSNumber*)result {
    if(resultBlocks == nil) return;
    
    resultBlocks([result boolValue]);
    resultBlocks = nil;
}
@end
