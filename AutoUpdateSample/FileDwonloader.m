//
//  FileDwonloader.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "FileDwonloader.h"

@implementation FileDwonloader
- (id)initWithURL:(NSString*)url directory:(NSString *)dir  fileHandleFactory:(FileHandleFactory*)fhf {
    if(self = [super init]) {
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
		con = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        directoryPath = dir;
        fileHandleFactory = fhf;
    }
    return self;
}

- (void)startWithBlocks:(ResultBlocks)blocks {
    resultBlocks = blocks;
    [con start];
}

- (void)cancel {
    [con cancel];
    [self returnResult:@NO];
}

- (void)returnResult:(NSNumber*)result {
    resultBlocks([result boolValue]);
    resultBlocks = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	filePath = [response suggestedFilename];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self returnResult:@NO];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    @try{
        [self appendData:data];
	} @catch (NSException * e) {
		[connection cancel];
        [self returnResult:@NO];
	}
}

- (void)appendData:(NSData*)data {
    if (file == nil) file = [fileHandleFactory createDirPath:directoryPath filePath:filePath];
    [file writeData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self returnResult:@YES];
}


@end
