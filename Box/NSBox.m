//
//  NSBox.m
//  Box
//
//  Created by Derrick Ho on 7/1/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import "NSBox.h"


@implementation NSDataProcessor
- (id)processData:(NSData *)data {
    return data;
}
@end

@implementation NSBox
- (instancetype)initWithValue:(id)value {
    if (self = [super init]) {
        _value = value;
    }
    return self;
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

@implementation GenericDataManager

- (instancetype)init {
    if (self = [super init]) {
        urlSession = [GenericURLSession new];
    }
    return self;
}

- (void)dataTaskWithRequest:(NSURLRequest *)urlRequest
              dataProcessor:(NSDictionary<NSString *, id>*  _Nullable (^)(NSData * _Nullable))dataProcessor
                 completion:(void (^)(NSDictionary<NSString *, id>* _Nullable
                                      , NSURLResponse * _Nullable
                                      , NSError * _Nullable))completion
{
    id<URLSessionDataTaskProtocol> session = [urlSession dataTaskWithRequest:urlRequest
                                                           completionHandler:^(NSData * _Nullable data
                                                                               , NSURLResponse * _Nullable response
                                                                               , NSError * _Nullable error)
                                              {
                                                  if (error) {
                                                      completion(nil, response, error);
                                                  } else {
                                                      completion(dataProcessor(data), response, nil);
                                                  }
                                              }];
    [session resume];
}

- (void)dataTaskWithRequest:(NSURLRequest *)urlRequest
              dataProcessor:(id  _Nullable (^)(NSData * _Nullable))dataProcessor1
              dataProcessor:(id  _Nullable (^)(NSData * _Nullable))dataProcessor2
                 completion:(void (^)(id _Nullable
                                      , NSURLResponse * _Nullable
                                      , NSError * _Nullable))completion
{
    
}

@end
