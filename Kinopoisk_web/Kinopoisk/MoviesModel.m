//
//  MoviesModel.m
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import "MovieItem.h"
#import "MovieLoader.h"
#import "MoviesModel.h"

@interface MoviesModel()
@property (nonatomic, strong) NSArray<MovieItem *> *movies;
@property (nonatomic, strong) MovieLoader *loader;
@end

@implementation MoviesModel


-  (void)loadMoviesWithCompletion:(VoidBlock)completion{
//   here we will do weak link on array of movie item
    __weak MoviesModel *weakSelf = self;
    [self.loader loadMovieWithCompletion:^(NSArray <MovieItem *> *movies) {
        weakSelf.movies = movies;
        completion();
    }];
// call:
// completion();
// by fact, lazy constructor isn't needed - delete it
}

- (MovieItem *)movieAtIndex:(NSInteger)index{
    //at first check that idx not out of bounds.If so - return nil
    if (index > self.movies.count) {
        return nil;
    }
    return self.movies[index];
}

- (NSUInteger)moviesCount{
    return self.movies.count;
}


- (MovieLoader *)loader{
    if (!_loader) {
        _loader = [[MovieLoader alloc] init];
    }
    return _loader;
}

// now our model is ready.Go to controller and do it!
@end
