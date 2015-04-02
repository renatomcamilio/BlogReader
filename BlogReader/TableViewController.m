//
//  TableViewController.m
//  BlogReader
//
//  Created by Renato Camilio on 12/21/14.
//  Copyright (c) 2014 Renato Camilio. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "WebViewController.h"
#import <UIImageView+WebCache.h>
#import <AFNetworking.h>


@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://blog.teamtreehouse.com/api/get_recent_summary/" parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             self.blogPosts = [NSMutableArray array];
             
             for (NSDictionary *blogPostDictionary in [responseObject objectForKey:@"posts"]) {
                 BlogPost *blogPost = [BlogPost blogPostWithTitle:[blogPostDictionary valueForKey:@"title"]];
                 blogPost.author = [blogPostDictionary valueForKey:@"author"];
                 blogPost.date = [blogPostDictionary valueForKey:@"date"];
                 blogPost.thumbnail = [blogPostDictionary valueForKey:@"thumbnail"];
                 blogPost.url = [blogPostDictionary valueForKey:@"url"];
                 
                 [self.blogPosts addObject:blogPost];
             }
             
             [self.tableView reloadData];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    self.categoryNames = [[NSSet setWithSet:[self.blogPosts mutableSetValueForKey:@"author"]] allObjects];

    return [self.categoryNames count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.categoryNames objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionName = self.categoryNames[section];

    return [[self postsForSection:section sectionName:sectionName] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    BlogPost *blogPost = [self postForIndexPath:indexPath];
    
    cell.textLabel.text = [blogPost title];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE, MMM d yyyy 'at' HH:mm"];
    cell.detailTextLabel.text = [dateFormat stringFromDate:[blogPost date]];
    
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]) {
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[blogPost thumbnail]]];
    }

    return cell;
}

#pragma mark - Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showBlogPost"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self postForIndexPath:indexPath];
        
        [segue.destinationViewController setBlogPostURL:blogPost.url];
    }
}

#pragma mark - Data Operations

- (BlogPost *) postForIndexPath:(NSIndexPath *)indexPath {
    NSString *sectionTitle = [self.categoryNames objectAtIndex:indexPath.section];
    NSArray *blogPostsList = [self postsForSection:indexPath.section sectionName:sectionTitle];

    return [blogPostsList objectAtIndex:indexPath.row];
}

- (NSArray *)postsForSection:(NSInteger)section sectionName:(NSString *)sectionName {
    NSMutableArray *posts = [[NSMutableArray alloc] init];
    
    [self.blogPosts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([[obj author] isEqualToString:sectionName]) {
            [posts addObject:obj];
        }
    }];
    
    return posts;
}

@end
