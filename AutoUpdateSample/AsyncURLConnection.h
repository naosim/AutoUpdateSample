//
//  AsyncURLConnection.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/01.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsyncURLConnection : NSObject {
    NSOperationQueue* queue;
}
- (void)sendAsynchronousRequest:(NSURLRequest *)request
completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))blocks;

- (NSURLConnection*)createConnectionWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately;
@end
