//
//  MoviesTableViewController.m
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//
#import "MovieCell.h"
#import "DetailedMovieTableViewController.h"
#import "MovieItem.h" // to get fields of this class
#import "MoviesModel.h"
#import "MoviesTableViewController.h"

//it should be as constant
static NSString *const kCellIdentifier = @"MovieCell";
static NSString *const kShowMovieSegue = @"ShowMovie";

@interface MoviesTableViewController ()
@property (nonatomic, strong) MoviesModel *model;
@end

@implementation MoviesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRefreshControl];
    [self reloadData];
}

- (void)addRefreshControl {
    self.tableView.refreshControl = [UIRefreshControl new];
    self.tableView.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"One second..."];
    [self.tableView.refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
}

- (void)reloadData {
    [self.tableView.refreshControl beginRefreshing];
    
    __weak MoviesTableViewController *weakSelf = self;
    VoidBlock reloading = ^{
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.refreshControl endRefreshing];
    };
    [self.model loadMoviesWithCompletion:reloading];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_model moviesCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    MovieItem *movieItem = [self.model movieAtIndex:indexPath.row];
    
    // Configure the cell...
    [self configureCell:cell withMovie:movieItem];
    
    return cell;
}

//method to config our cells
- (void)configureCell:(MovieCell *)cell withMovie:(MovieItem *)movie {
      cell.movieTitle.text = movie.movieTitle;
      cell.movieDescription.text = movie.movieDescription;

      cell.poster.image = [UIImage imageNamed:movie.imageName];
}

//initialize  model
- (MoviesModel *)model {
    //constructor for model
    if (!_model) {
        _model = [[MoviesModel alloc] init];
    }
    return _model;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  UITableViewAutomaticDimension;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(MovieCell *)sender {
    if ([segue.identifier isEqualToString:kShowMovieSegue]) {
        DetailedMovieTableViewController *detailedVC = segue.destinationViewController;
        detailedVC.movieItem = [_model movieAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

@end
