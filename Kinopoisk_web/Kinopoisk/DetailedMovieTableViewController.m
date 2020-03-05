//
//  DetailedMoviesTableViewController.m
//  Kinopoisk
//
//  Created by Nati on 3/3/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import "DetailedMovieCell.h"
#import "DetailedMovieTableViewController.h"
#import "MovieItem.h"

static NSString *const kCellIdentifier = @"DetailedMovieCell";

@interface DetailedMovieTableViewController ()

@end

@implementation DetailedMovieTableViewController

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailedMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    [self configureCell:cell];
    return cell;
}

- (void) configureCell:(DetailedMovieCell *)cell {
    cell.poster.image = [UIImage imageNamed:self.movieItem.imageName];
    cell.movieTitle.text = self.movieItem.movieTitle;
    cell.movieDescription.text = self.movieItem.movieDescription;
    cell.date.text = [NSString stringWithFormat:@"Release year: %@", self.movieItem.date];
}

@end
