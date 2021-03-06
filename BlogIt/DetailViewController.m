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
    
    NSLog(@"%@", _blog.blogID);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BlogPost *)createBlogPost {

    if (_blog == nil) {
        NSDate *pubDate = [NSDate date];
        NSString *blogID = [[NSUUID UUID]UUIDString];
        _blog = [BlogPost initWithBlogTitle:_blogTitle.text authorName:_authorName.text postBody:_body.text date:pubDate blogID:blogID];
        NSLog(@"New blog post info:\nTitle: %@\nAuthor: %@\nDate: %@\nBody: %@ \nID:%@", _blog.title, _blog.authorName, _blog.date, _blog.postBody, _blog.blogID);
    } else {
        _blog = [BlogPost initWithBlogTitle:_blogTitle.text authorName:_authorName.text postBody:_body.text date:_blog.date blogID:_blog.blogID];
    }

    return _blog;
}

- (IBAction)saveBlog:(id)sender {
    BlogPost *newBlogPost = [self createBlogPost];
    [_delegate addBlogToArray:newBlogPost];
}

- (IBAction)editButton:(id)sender {
    [_blogTitle setUserInteractionEnabled:YES];
    [_authorName setUserInteractionEnabled:YES];
    [_body setEditable:YES];
}



@end
