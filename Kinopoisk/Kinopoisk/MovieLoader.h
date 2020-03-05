//
//  MovieLoader.h
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieItem; //such class exists and we can call it, but it isn't import as is

@interface MovieLoader : NSObject

- (NSArray <MovieItem *> *) loadMovies;

@end
