//
//  WebViewController.m
//  BlogReader
//
//  Created by Renato Camilio on 12/24/14.
//  Copyright (c) 2014 Renato Camilio. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[self blogPostURL]];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
