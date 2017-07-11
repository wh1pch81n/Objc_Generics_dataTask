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

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        _wResource = [Resource new];
        _wService = [WebService new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self experiment];
    
    _wResource = [[Resource <MyDictionary <NSString *, id> *> alloc] initWithURLRequest:^NSURLRequest * _Nonnull{
        return [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.myjson.com/bins/e4xc3"]];
    } dataProcessor:^MyDictionary<NSString *,id> * _Nullable(NSData * _Nullable data) {
        if (data == nil) { return nil; }
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:nil];
        if ([dict isKindOfClass:[NSDictionary class]]) {
            MyDictionary *md = [MyDictionary new];
            md.dictionary = dict;
            return md;
        }
        return nil;
    }];
    
    [_wService dataTaskWithResource:_wResource completion:^(MyDictionary<NSString *,id> * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", data.dictionary.allKeys.firstObject);
        NSLog(@"%@", data.dictionary.allValues.firstObject);
    }];
}

@end
