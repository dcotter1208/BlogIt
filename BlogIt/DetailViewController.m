//
//  DetailViewController.m
//  BlogIt
//
//  Created by Brandon Manson on 5/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *blogTitle;
@property (weak, nonatomic) IBOutlet UITextField *authorName;
@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *editButton;



@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *formattedDate = [NSString stringWithFormat:@"%@", _blog.date];
    
    _blogTitle.text = _blog.title;
    _authorName.text = [NSString stringWithFormat:@"Author: %@", _blog.authorName];
    _date.text = [NSString stringWithFormat:@"Date: %@", formattedDate];
    _body.text = _blog.postBody;
    
    NSLog(@"%@", _blog.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BlogPost *)createBlogPost {
    NSDate *pubDate = [NSDate date];
    BlogPost *newBlog = [BlogPost initWithBlogTitle:_blogTitle.text authorName:_authorName.text postBody:_body.text date:pubDate];
    NSLog(@"New blog post info:\nTitle: %@\nAuthor: %@\nDate: %@\nBody: %@", newBlog.title, newBlog.authorName, newBlog.date, newBlog.postBody);
    
    return newBlog;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveBlog:(id)sender {
    BlogPost *newBlogPost = [self createBlogPost];
    [_delegate addBlogToArray:newBlogPost];
}

@end
