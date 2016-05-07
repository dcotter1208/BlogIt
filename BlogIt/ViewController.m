//
//  ViewController.m
//  BlogIt
//
//  Created by Donovan Cotter on 5/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *blogTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *date = [NSDate date];
    
    _blogs = [NSMutableArray array];
    BlogPost *postOne = [BlogPost initWithBlogTitle:@"Blog One" authorName:@"Brandon" postBody:@"Yay!" date:date];
    [_blogs addObject:postOne];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _blogs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    _blogPost = _blogs[indexPath.row];
    cell.textLabel.text = _blogPost.title;
    cell.detailTextLabel.text = _blogPost.authorName;
    
    return cell;
    
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *destinationViewController = (DetailViewController *)segue.destinationViewController;
    
    NSIndexPath *indexPath = [_blogTableView indexPathForSelectedRow];
    
    destinationViewController.blog = [_blogs objectAtIndex:indexPath.row];
}

@end
