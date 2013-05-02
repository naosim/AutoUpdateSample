//
//  AsyncURLConnectionMock.m
//  AutoUpdateSample
//
//  Created by 藤田 直 on 13/05/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "AsyncURLConnectionMock.h"

@implementation AsyncURLConnectionMock
- (id)initWithResponse:(NSURLResponse*)inres data:(NSData*)indata error:(NSError*)inerror {
    if(self = [super init]) {
        res = inres;
        data = indata;
        error = inerror;
    }
    return self;
}
- (id)initWithResponse:(NSURLResponse*)inres strData:(NSString*)instrData error:(NSError*)inerror {
    NSData* indata = [instrData dataUsingEncoding:NSUTF8StringEncoding];
    self = [self initWithResponse:inres data:indata error:inerror];
    return self;
}
- (id)initForOffline {
    self = [self initWithResponse:nil data:nil error:nil];
    return self;
}

- (id)initWithResponseStrData:(NSString*)strData {
    self = [self initWithResponse:[NSURLResponse new] strData:strData error:nil];
    return self;
}

- (void)sendAsynchronousRequest:(NSURLRequest *)request
              completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*))blocks {
    blocks(res, data, error);
}
@end
