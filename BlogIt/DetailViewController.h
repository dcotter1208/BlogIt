//
//  DetailViewController.h
//  BlogIt
//
//  Created by Brandon Manson on 5/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogPost.h"

@protocol AddBlogToArrayDelegate <NSObject>

- (void)addBlogToArray:(BlogPost *)blogToPass;

@end

@interface DetailViewController : UIViewController

@property(nonatomic, strong) BlogPost *blog;
@property(nonatomic, weak) id<AddBlogToArrayDelegate>delegate;

- (BlogPost *)createBlogPost;


@end
