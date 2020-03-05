//
//  MovieLoader.h
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MoviesBlock)(NSArray <MovieItem *> *);

//such class exists and we can call it, but it isn't import as is
@class MovieItem;

@interface MovieLoader : NSObject
// method where we provide and mimic connection with network
- (void) loadMovieWithCompletion:(MoviesBlock)completion;
@end
