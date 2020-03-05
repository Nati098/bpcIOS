//
//  MoviesModel.h
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//
//2 roles: num of fields and give the movie by id

#import <Foundation/Foundation.h>

typedef void (^VoidBlock) (void);
//we just say compiler that we have such class
@class MovieItem;

@interface MoviesModel : NSObject

//here will be other different block
- (void)loadMoviesWithCompletion:(VoidBlock)completion;

- (MovieItem *)movieAtIndex:(NSInteger)index;
- (NSUInteger)moviesCount; // UNSIGNED!

@end

