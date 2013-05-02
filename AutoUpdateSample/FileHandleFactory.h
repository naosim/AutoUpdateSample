//
//  FileHandleFactory.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHandleFactory : NSObject {
    NSFileManager* fileManager;
}
- (id)initWithFileManager:(NSFileManager*)fm;
- (NSFileHandle*)createDirPath:(NSString*)directoryPath filePath:(NSString*)filePath;
@end

