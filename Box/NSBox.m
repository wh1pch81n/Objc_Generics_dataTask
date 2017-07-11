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

@implementation Resource
- (instancetype)initWithURLRequest:(NSURLRequest * _Nonnull (^)(void))urlRequest dataProcessor:(id  _Nullable (^)(NSData * _Nonnull))dataProcessor {
    if (self = [super init]) {
        _urlSession = [GenericURLSession new];
        _urlRequest = urlRequest;
        _dataProcessor = dataProcessor;
    }
    return self;
}
@end

@implementation WebService
- (void)dataTaskWithResource:(Resource *)resource completion:(void (^)(id _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completion {
    [[resource.urlSession dataTaskWithRequest:resource.urlRequest()
                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                completion(resource.dataProcessor(data), response, error);
                            }] resume];
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

