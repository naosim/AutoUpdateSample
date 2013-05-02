//
//  FileDwonloader.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultBlocks.h"
#import "FileHandleFactory.h"

@interface FileDwonloader : NSObject<NSURLConnectionDataDelegate> {
    NSString *directoryPath;
	NSString *filePath;
	NSFileHandle *file;
	NSURLConnection *con;
    FileHandleFactory* fileHandleFactory;
    ResultBlocks resultBlocks;
}
- (id)initWithURL:(NSString*)url directory:(NSString *)dir fileHandleFactory:(FileHandleFactory*)fhf;
- (void)startWithBlocks:(ResultBlocks)blocks;
- (void)cancel;
@end
