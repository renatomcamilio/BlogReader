//
//  BlogPost.m
//  BlogReader
//
//  Created by Renato Camilio on 12/21/14.
//  Copyright (c) 2014 Renato Camilio. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.author = nil;
        self.date = nil;
        self.thumbnail = nil;
        self.url = nil;
    }
    
    return self;
}

+ (id) blogPostWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (void) setDate:(NSString *)dateStr {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    _date = [dateFormat dateFromString:dateStr];
}

- (void) setUrl:(NSString *)urlStr {
    _url = [NSURL URLWithString:urlStr];
}

@end
