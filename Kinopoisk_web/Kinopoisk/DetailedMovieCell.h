//
//  DetailedMovieCellTableViewCell.h
//  Kinopoisk
//
//  Created by Nati on 3/3/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailedMovieCell : MovieCell

@property (nonatomic, weak) IBOutlet UILabel *date;

@end

NS_ASSUME_NONNULL_END
