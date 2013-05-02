//
//  ManifestChekerTest.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "ManifestChekerTest.h"
#import "AsyncURLConnection.h"
#import "OriginalVersionData.h"

@interface AsyncURLConnectionMock : AsyncURLConnection

@end
@implementation AsyncURLConnectionMock

- (void)sendAsynchronousRequest:(NSURLRequest *)request
              completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))blocks {
}

@end



@implementation ManifestChekerTest
- (void)testExample
{
    OriginalVersionData* versinData = OriginalVersionData.new;
    UpdateCheker* cheker = [[UpdateCheker alloc] initWithURL:@"" versionData:versinData asyncURLConnection:nil];
    [cheker checkUpdate:^(BOOL result) {
        STAssertTrue(result, @"アップデートあり");
    }];
    
    //STFail(@"Unit tests are not implemented yet in AutoUpdateSampleTests");
}

@end
