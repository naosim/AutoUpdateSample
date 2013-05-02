//
//  AsyncURLConnectionMock.h
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "AsyncURLConnection.h"

@interface AsyncURLConnectionMock : AsyncURLConnection {
    NSURLResponse* res;
    NSData* data;
    NSError* error;
}
- (id)initWithResponse:(NSURLResponse*)res data:(NSData*)data error:(NSError*)error;
- (id)initWithResponse:(NSURLResponse*)res strData:(NSString*)strData error:(NSError*)error;
- (id)initForOffline;
- (id)initWithResponseStrData:(NSString*)strData;
@end