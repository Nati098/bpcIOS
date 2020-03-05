//
//  MoviesTableViewController.m
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//
#import "MovieCell.h"
#import "MovieItem.h" // to get fields of this class
#import "MoviesModel.h"
#import "MoviesTableViewController.h"

//it should be as constant
static NSString *const kCellIdentifier = @"MovieCell";

@interface MoviesTableViewController ()
@property (nonatomic, strong) MoviesModel *model;
@end


@implementation MoviesTableViewController

#pragma mark - Table view data source

// if we delete this, it returns by default 1
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

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

@end
