//
//  ViewController.h
//  BlogIt
//
//  Created by Donovan Cotter on 5/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogPost.h"

@interface ViewController : UIViewController

@property(nonatomic, strong) NSMutableArray *blogs;
@property(nonatomic, strong) BlogPost *blogPost;

@end

