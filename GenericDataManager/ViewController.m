//
//  ViewController.m
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import "ViewController.h"
#import "GenericDataManager-Swift.h"
@import Box;

@implementation SimpleDataSession
@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    _wService = [[WebService alloc] initWithURLSession:[SimpleDataSession new]];
    [self experiment];
    self.label.text = @"bread";
    UILabel *l = [UILabel new];
    l.text = @"cars";
    
    MyArray<UILabel *> *ml = [[MyArray <UILabel *> alloc] init];
    ml.array = @[@""];
    
    SimpleDataSession *ss = _wService.urlSession;
    // Using vanilla API
    [_wService dataTaskWithURLRequest:[ss urlRequest:[NSNull null]]
                        dataProcessor:[ss dataProcessor]
                           completion:^(MyDictionary<NSString *,id> * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                               NSLog(@"1 key: %@", data.dictionary.allKeys.firstObject);
                               NSLog(@"1 value: %@", data.dictionary.allValues.firstObject);
                           }];

    [_wService makeQuery:nil
              completion:^(MyDictionary<NSString *,id> *data, NSURLResponse *response, NSError *error) {
                  NSLog(@"2 key:  %@", data.dictionary.allKeys.firstObject);
                  NSLog(@"2 value: %@", data.dictionary.allValues.firstObject);
              }];
    
}

@end
