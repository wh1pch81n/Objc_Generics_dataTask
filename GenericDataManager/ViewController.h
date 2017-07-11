//
//  ViewController.h
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Box;

NS_ASSUME_NONNULL_BEGIN

@interface ViewController: UIViewController
@property Resource<MyDictionary <NSString *, id> *> *wResource;
@property WebService<MyDictionary <NSString *, id> *> *wService;
@end

NS_ASSUME_NONNULL_END
