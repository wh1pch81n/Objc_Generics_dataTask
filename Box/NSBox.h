//
//  NSBox.h
//  Box
//
//  Created by Derrick Ho on 7/1/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyArray<__covariant T>: NSObject
@property (strong, nonatomic) NSArray<T> *array;
@end

@interface MyDictionary<__covariant K, __covariant V>: NSObject
@property (strong, nonatomic) NSDictionary<K, V> *dictionary;
@end

@class GenericURLSession;
@interface Resource<__covariant PROCESSED_RESULT: id> : NSObject
@property (strong) GenericURLSession *urlSession;
@property (copy) NSURLRequest *(^urlRequest)(void);
@property (copy) PROCESSED_RESULT _Nullable(^dataProcessor)(NSData *_Nullable data);
- (instancetype)initWithURLRequest:(NSURLRequest *(^)(void))urlRequest
                     dataProcessor:(PROCESSED_RESULT _Nullable(^)(NSData *_Nullable data))dataProcessor;
@end

@interface WebService<__covariant PROCESSED_RESULT: id> : NSObject
- (void)dataTaskWithResource:(Resource <PROCESSED_RESULT>*)resource
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
