//
//  BlogPost.h
//  BlogReader
//
//  Created by Renato Camilio on 12/21/14.
//  Copyright (c) 2014 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSURL *url;

- (id) initWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *)title;

- (void) setDate:(NSDate *)date;
- (void) setUrl:(NSURL *)url;

@end
