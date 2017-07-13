//
//  ViewController.m
//  GenericDataManager
//
//  Created by Derrick Ho on 4/27/17.
//  Copyright © 2017 Derrick Ho. All rights reserved.
//

#import "ViewController.h"
#import "GenericDataManager.h"
#import "GenericDataManager-Swift.h"
@import Box;

@implementation SimpleDataSession
@end

@implementation ViewController 

- (instancetype)init {
    if (self = [super init]) {
        _wService = [WebService new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self experiment];
    
    SimpleDataSession *ss = _wService.urlSession;
    [_wService dataTaskWithURLRequest:[ss urlRequest:[NSNull null]]
                        dataProcessor:[ss dataProcessor]
                           completion:^(MyDictionary<NSString *,id> * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                               NSLog(@"%@", data.dictionary.allKeys.firstObject);
                               NSLog(@"%@", data.dictionary.allValues.firstObject);
                           }];

//    [_wService dataTaskWithResource:_wResource completion:^(MyDictionary<NSString *,id> * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//    }];
}

@end
