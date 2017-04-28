//
//  GenericDataManager.h
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol URLSessionDataTaskProtocol <NSObject>

- (void)resume;

@end

@interface NSURLSessionDataTask (URLSessionDataTaskProtocol) <URLSessionDataTaskProtocol>

@end

@interface GenericURLSession: NSObject
- (id<URLSessionDataTaskProtocol>)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;
@end

@interface GenericDataManager <__covariant T: id> : NSObject {
	GenericURLSession *urlSession;
}

- (void)dataTaskWithRequest:(NSURLRequest *)urlRequest dataProcessor:(T _Nullable(^)(NSData *_Nullable data))dataProcessor1 completion:(void(^)(T _Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error))completion;


@end

NS_ASSUME_NONNULL_END
