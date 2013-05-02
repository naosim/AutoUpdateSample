//
//  FileHandleFactory.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleFileManager : NSObject {
    NSFileManager* fileManager;
}
@property (nonatomic, strong, readonly)NSFileManager* fileManager;

- (id)initWithFileManager:(NSFileManager*)fm;
- (NSFileHandle*)createFileHandleWithDirPath:(NSString*)directoryPath filePath:(NSString*)filePath;
- (void)clearDirectory:(NSString*)dir;
@end

