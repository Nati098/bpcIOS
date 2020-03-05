//
//  DetailedMoviesTableViewController.h
//  Kinopoisk
//
//  Created by Nati on 3/3/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovieItem;

@interface DetailedMovieTableViewController : UITableViewController
@property (nonatomic, weak) MovieItem *movieItem;
@end
