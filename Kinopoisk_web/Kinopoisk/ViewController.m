//
//  ViewController.m
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 mimic of loading data \this method is called 1 time at start
 - (void)viewDidLoad {
    [super viewDidLoad[; - it must be
 and ask a model to load data
 using weak references!!!
 update data in table
 }
 
 - (void) addRefreshControl {
 self.tableView.refreshControl = [UIRefreshControl new];
 self.tableView.refreshControl = [[NSAttributedString alloc] initWithString:@"Loading..."];
 
 // adding action which will be alled when we refreshin table
 self.tableView.refreshControl addTerget:self
 action:@selector(reloadData)...;
 
 needed method of selector
 - (void)reloadData {
 code with weak references here
 and hide scrolling (refreshControl endRefreshing)
 }
 }
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
