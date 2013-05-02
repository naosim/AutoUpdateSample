//
//  AsyncURLConnection.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "AsyncURLConnection.h"

@implementation AsyncURLConnection
- (void)sendAsynchronousRequest:(NSURLRequest *)request
              completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))blocks {
    if(!queue) queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:blocks];
}
@end
