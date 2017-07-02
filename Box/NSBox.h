//
//  NSBox.h
//  Box
//
//  Created by Derrick Ho on 7/1/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSDictionary<NSString *, id>* NSDictionaryStringAny;



NS_ASSUME_NONNULL_BEGIN

@interface NSDataProcessor <__covariant T: id> : NSObject
- (T _Nullable)processData:(NSData *)data;
@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

@interface NSBox <__covariant T: id> : NSObject
@property T value;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithValue:(T)value;
@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

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

@interface GenericDataManager <__covariant T: id> : NSObject {
    GenericURLSession *urlSession;
}

- (void)dataTaskWithRequest:(NSURLRequest *)urlRequest
              dataProcessor:(NSDictionary<NSString *, T>* _Nullable(^)(NSData *_Nullable data))dataProcessor1
                 completion:(void(^)(NSDictionary<NSString *, T>* _Nullable data
                                     , NSURLResponse *_Nullable response
                                     , NSError *_Nullable error))completion;


@end

NS_ASSUME_NONNULL_END
