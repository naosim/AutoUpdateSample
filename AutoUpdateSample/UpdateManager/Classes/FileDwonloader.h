//
//  FileDwonloader.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultBlocks.h"
#import "SimpleFileManager.h"
#import "AsyncURLConnection.h"

@interface FileDwonloader : NSObject<NSURLConnectionDataDelegate> {
    NSString *directoryPath;
	NSString *filePath;
	NSFileHandle *file;
	NSURLConnection *con;
    SimpleFileManager* fileHandleFactory;
    ResultBlocks resultBlocks;
}
- (id)initWithURL:(NSString*)url directory:(NSString *)dir fileHandleFactory:(SimpleFileManager*)fhf asyncURLConnection:(AsyncURLConnection*)asyncURLConnection;
- (void)startWithBlocks:(ResultBlocks)blocks;
- (void)cancel;
@end
