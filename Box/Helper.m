//
//  Helper.m
//  GenericDataManager
//
//  Created by Derrick Ho on 7/19/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import "Helper.h"

@interface GenericURLSession (private_ext)
- (NSURLRequest *(^)(void))urlRequest:(id)data;
- (id (^)(NSData *))dataProcessor;
@end

@implementation WebService (extension)
- (void)makeQuery:(id)query completion:(void (^)(id, NSURLResponse *, NSError *))completion {
    NSAssert([self.urlSession respondsToSelector:@selector(urlRequest:)], @"urlSession does not implement urlRequest(_:) -> () -> URLRequest");
    NSAssert([self.urlSession respondsToSelector:@selector(dataProcessor)], @"urlSession does not implement dataProcessor() -> (Data) -> URLRequest");
    
    [self dataTaskWithURLRequest:[self.urlSession urlRequest:query]
                   dataProcessor:[self.urlSession dataProcessor]
                      completion:^(id  _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                          completion(data, response, error);
                      }];
}

@end
