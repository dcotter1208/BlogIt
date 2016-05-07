//
//  BlogPost.h
//  BlogIt
//
//  Created by Donovan Cotter on 5/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *authorName;
@property(nonatomic, strong) NSString *postBody;
@property(nonatomic, strong) NSDate *date;

-(id)initWithBlogTitle:(NSString *)title authorName:(NSString *)authorName postBody:(NSString *)postBody date:(NSDate *)date;
+(id)initWithBlogTitle:(NSString *)title authorName:(NSString *)authorName postBody:(NSString *)postBody date:(NSDate *)date;

@end
