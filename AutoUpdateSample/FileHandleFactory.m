//
//  FileHandleFactory.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "FileHandleFactory.h"

#ifdef DEBUG
#  define LOG(...) NSLog(__VA_ARGS__)
#  define LOG_CURRENT_METHOD NSLog(NSStringFromSelector(_cmd))
#else
#  define LOG(...) ;
#  define LOG_CURRENT_METHOD ;
#endif

#define APPLICATION_TMP_DIR	[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"]
#define APPLICATION_DOC_DIR	[NSHomeDirectory() stringByAppendingPathComponent:  @"Documents"]


@interface NSFileManager (Utility)

- (NSString *)suggestFilePath:(NSString *)path;
- (void) clearTmpDirectory;

@end

@implementation NSFileManager (Utility)

- (NSString *)suggestFilePath:(NSString *)path {
	if (path == nil) path = @"";
	NSString *parentPath = [path stringByDeletingLastPathComponent];
	NSArray *components = [path pathComponents];
	NSString *nameBody = ([components count] == 0) ? @"" : [components lastObject];
	NSString *ext = [nameBody pathExtension];
	nameBody = [nameBody stringByDeletingPathExtension];
	
	NSString *tmpPath = path;
	int suffix = 0;
	while ([self fileExistsAtPath:tmpPath]) {
		suffix++;
		tmpPath = [parentPath stringByAppendingPathComponent:[nameBody stringByAppendingFormat:@"%d", suffix]];
		if ([ext length] > 0) tmpPath = [tmpPath stringByAppendingPathExtension:ext];
		tmpPath = [tmpPath stringByStandardizingPath];
	}
	return tmpPath;
}

- (void) clearTmpDirectory {
    
	NSArray *contents = [self contentsOfDirectoryAtPath:APPLICATION_TMP_DIR error:nil];
	NSString *path;
	for (path in contents) {
		[self removeItemAtPath:[APPLICATION_TMP_DIR stringByAppendingPathComponent:path] error:nil];
	}
}

@end


@implementation FileHandleFactory
- (id)initWithFileManager:(NSFileManager*)fm {
    if(self = [super init]) {
        fileManager = fm;
    }
    return self;
}

- (NSFileHandle*)createDirPath:(NSString*)directoryPath filePath:(NSString*)filePath {
    BOOL isDir;
    if (![fileManager fileExistsAtPath:directoryPath isDirectory:&isDir]) {
        NSError *error;
        if (![fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:&error]) {
        }
    } else if (!isDir) {
        [NSException raise:@"Exception" format:@"Failed to create directory at %@, because there is a file already.", directoryPath];
    }
    
    NSString *tmpFilePath = [fileManager suggestFilePath:[[directoryPath stringByAppendingPathComponent:filePath] stringByStandardizingPath]];
    filePath = tmpFilePath;
    [fileManager createFileAtPath:filePath contents:[NSData data] attributes:nil];
    
    return [NSFileHandle fileHandleForWritingAtPath:filePath];
}

@end