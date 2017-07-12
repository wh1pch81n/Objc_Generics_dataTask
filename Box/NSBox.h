//
//  NSBox.h
//  Box
//
//  Created by Derrick Ho on 7/1/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class GenericURLSession;

@interface MyArray<__covariant T>: NSObject
@property (strong, nonatomic) NSArray<T> *array;
@end

@interface MyDictionary<__covariant K: NSString *, __covariant V>: NSObject
@property (strong, nonatomic) NSDictionary<K, V> *dictionary;
@end

@interface WebService<__covariant PROCESSED_RESULT: id, __covariant URL_SESSION: GenericURLSession *> : NSObject

@property URL_SESSION urlSession;

- (instancetype)initWithURLSession:(URL_SESSION)urlSession;

- (void)dataTaskWithURLRequest:(NSURLRequest *(^)(void))urlRequest
                 dataProcessor:(PROCESSED_RESULT _Nullable(^)(NSData *_Nullable data))dataProcessor
                    completion:(void(^)(PROCESSED_RESULT _Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error))completion;
@end

@protocol URLSessionDataTaskProtocol <NSObject>
- (void)resume;
@end

@interface NSURLSessionDataTask (URLSessionDataTaskProtocol) <URLSessionDataTaskProtocol>

@end

@interface GenericURLSession: NSObject
- (id<URLSessionDataTaskProtocol>)dataTaskWithRequest:(NSURLRequest *)request
                                    completionHandler:(void (^)(NSData * _Nullable data
                                                                , NSURLResponse * _Nullable response
                                                                , NSError * _Nullable error))completionHandler;
@end

NS_ASSUME_NONNULL_END
