//
//  ViewController.m
//  BlogIt
//
//  Created by Donovan Cotter on 5/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *date = [NSDate date];
    
    _blogs = [NSMutableArray array];
    _blogPost = [BlogPost initWithBlogTitle:@"Blog One" authorName:@"Brandon" postBody:@"Yay!" date:date];
    [_blogs addObject:_blogPost];
    
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

@end
