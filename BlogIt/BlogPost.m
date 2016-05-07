//
//  BlogPost.m
//  BlogIt
//
//  Created by Donovan Cotter on 5/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

-(id)initWithBlogTitle:(NSString *)title authorName:(NSString *)authorName postBody:(NSString *)postBody date:(NSDate *)date {
    self = [super init];
    
    if (self) {
        _title = title;
        _authorName = authorName;
        _postBody = postBody;
        _date = date;
    }
    
    return self;
}

+(id)initWithBlogTitle:(NSString *)title authorName:(NSString *)authorName postBody:(NSString *)postBody date:(NSDate *)date {
    return [[self alloc]initWithBlogTitle:title authorName:authorName postBody:postBody date:date];
}

@end
