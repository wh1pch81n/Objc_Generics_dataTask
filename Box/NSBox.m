//
//  NSBox.m
//  Box
//
//  Created by Derrick Ho on 7/1/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import "NSBox.h"

@implementation MyArray
@end
@implementation MyDictionary
@end

@implementation WebService

- (instancetype)initWithURLSession:(GenericURLSession *)urlSession {
    if (self = [super init]) {
        _urlSession = urlSession;
    }
    return self;
}

- (void)dataTaskWithURLRequest:(NSURLRequest *(^)(void))urlRequest dataProcessor:(id  _Nullable (^)(NSData * _Nullable))dataProcessor completion:(void (^)(id _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completion
{
    id<URLSessionDataTaskProtocol> dataTask;
    dataTask = [_urlSession dataTaskWithRequest:urlRequest()
                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                       completion(dataProcessor(data), response, error);
                   }];
    
    [dataTask resume];
}

@end

@implementation GenericURLSession

- (id<URLSessionDataTaskProtocol>_Nonnull)dataTaskWithRequest:(NSURLRequest *_Nonnull)request
                                            completionHandler:(void (^)(NSData * _Nullable data
                                                                        , NSURLResponse * _Nullable response
                                                                        , NSError * _Nullable error))completionHandler
{
    return [NSURLSession.sharedSession dataTaskWithRequest:request
                                         completionHandler:completionHandler];
}

@end

