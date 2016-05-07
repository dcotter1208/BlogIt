//
//  DetailViewController.m
//  BlogIt
//
//  Created by Brandon Manson on 5/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *blogTitle;
@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UITextView *body;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *formattedDate = [NSString stringWithFormat:@"%@", _blog.date];
    
    _blogTitle.text = _blog.title;
    _authorName.text = _blog.authorName;
    _date.text = formattedDate;
    _body.text = _blog.postBody;
    
    NSLog(@"%@", _blog.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
