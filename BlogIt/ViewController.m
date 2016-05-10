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
    
    _blogs = [NSMutableArray array];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [_blogTableView reloadData];
}

- (void)addBlogToArray:(BlogPost *)blogToPass {
    
    NSMutableArray *postsToUpdate = [NSMutableArray array];
    
    for (BlogPost *blog in _blogs) {
        if ([blog.blogID isEqualToString:blogToPass.blogID]) {
            [postsToUpdate addObject:blog];
        }
    }
    
    [_blogs removeObjectsInArray:postsToUpdate];
    [_blogs addObject:blogToPass];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _blogs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    BlogPost *post = _blogs[indexPath.row];
    cell.textLabel.text = post.title;
    cell.detailTextLabel.text = post.authorName;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_blogs removeObjectAtIndex:indexPath.row];
        [_blogTableView reloadData];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *destinationViewController = (DetailViewController *)segue.destinationViewController;
    [destinationViewController setDelegate:self];
    
    if ([segue.identifier isEqualToString:@"viewPost"]) {
        
        NSIndexPath *indexPath = [_blogTableView indexPathForSelectedRow];
        _blogPost = [_blogs objectAtIndex:indexPath.row];
        destinationViewController.blog = _blogPost;
    } else {
        destinationViewController.blog = nil;
    }
    
    
}

@end
