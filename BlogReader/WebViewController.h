//
//  WebViewController.h
//  BlogReader
//
//  Created by Renato Camilio on 12/24/14.
//  Copyright (c) 2014 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
