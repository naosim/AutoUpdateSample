//
//  OriginalVersionData.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "OriginalVersionData.h"

@implementation OriginalVersionData
- (id)initWithUserDefaults:(NSUserDefaults*)inuserDefaults {
    if(self = [super init]) {
        userDefaults = inuserDefaults;
    }
    return self;
}
- (BOOL)isUpdateWithVersion:(int)version {return NO;}
- (void)setVersion:(int)version {}

@end
