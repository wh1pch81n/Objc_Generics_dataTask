//
//  Helper.h
//  GenericDataManager
//
//  Created by Derrick Ho on 7/19/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSBox.h"

@interface WebService<__covariant PROCESSED_RESULT: id, __covariant URL_SESSION: GenericURLSession *> (extension)
- (void)makeQuery:(id)query completion:(void(^)(PROCESSED_RESULT data, NSURLResponse *response, NSError *error))completion;
@end
