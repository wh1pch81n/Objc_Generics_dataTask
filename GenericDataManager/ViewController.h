//
//  ViewController.h
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericDataManager.h"

id something;

@interface Col: NSObject
- (NSArray <NSString *> *)gate;

@property id something;

@end

@interface NSBox <__covariant T: id> : NSObject

@property T _Nullable value;

- (instancetype _Nonnull )initWithValue:(T _Nullable )value;

@end
NSBox <NSArray<NSString *> *> *globalBox;

@interface ViewController : UIViewController

@property NSBox <NSString *>*_Nullable boxingBoxing;

@property GenericDataManager <NSBox <NSString *>*>* _Nullable boxing;

@property GenericDataManager <NSArray <NSString *>*>* _Nullable arr;


@property (readonly) GenericDataManager <NSDictionary <NSString *, id>*>*_Nonnull arr_swift NS_REFINED_FOR_SWIFT;

@end

