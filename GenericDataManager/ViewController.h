//
//  ViewController.h
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Box;

@interface SimpleDataSession: GenericURLSession
@end

NS_ASSUME_NONNULL_BEGIN

@interface ViewController: UIViewController

@property (weak) IBOutlet UILabel *label;
@property WebService<MyDictionary <NSString *, id> *, SimpleDataSession *> *wService;
@end

NS_ASSUME_NONNULL_END
