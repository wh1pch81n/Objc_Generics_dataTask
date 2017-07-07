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
        _box = [[NSBox<NSString *> alloc] initWithValue:@"hi"];
        _nox = [[NSBox<NSNumber *> alloc] initWithValue:@(9)];
        _gdm = [[GenericDataManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self experiment];
    
    NSData *d;
    [[NSDataProcessor <NSString *>new] processData:d];
}

@end


//@interface SwiftViewController (thing)
//- (NSBox <NSString *>*)thing NS_SWIFT_UNAVAILABLE("");
//@end
//@implementation SwiftViewController (thing)
//- (NSBox *)thing {
//    return [self valueForKey:@"_objcThing"];
//}
//@end

