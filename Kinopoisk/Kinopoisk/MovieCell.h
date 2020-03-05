//
//  MovieCell.h
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *poster;
@property (nonatomic, weak) IBOutlet UILabel *movieTitle;
@property (nonatomic, weak) IBOutlet UILabel *movieDescription;

@end
