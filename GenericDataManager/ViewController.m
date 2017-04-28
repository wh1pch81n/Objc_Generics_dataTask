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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	//http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC
	
	GenericDataManager <UIImage *> *dataManager = [GenericDataManager new];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC"]];
	
	[dataManager dataTaskWithRequest:request
					   dataProcessor:^UIImage *_Nullable(NSData * _Nullable data) {
						   if (!data) return nil;
						   
						   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
						   NSString *urlString = dict[@"data"][@"image_url"];
						   NSURL *url = [NSURL URLWithString:urlString];
						   NSData *urlData = [NSData dataWithContentsOfURL:url];
						   UIImage *img = [UIImage imageWithData:urlData];
						   
						   return img;
					   } completion:^(UIImage *_Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
						   dispatch_async(dispatch_get_main_queue(), ^{
							   self.view.backgroundColor = [UIColor colorWithPatternImage:data];
							   
							   [self doIt];
						   });
					   }];
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
