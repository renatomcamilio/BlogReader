//
//  TableViewController.h
//  BlogReader
//
//  Created by Renato Camilio on 12/21/14.
//  Copyright (c) 2014 Renato Camilio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *blogPosts;
@property (nonatomic, strong) NSArray *categoryNames;

@end
