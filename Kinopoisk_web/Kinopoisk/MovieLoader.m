//
//  MovieLoader.m
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

// class corresponding to loading data. It will return an array of films

#import "MovieItem.h"
#import "MoviesJsonData.h"
#import "MovieLoader.h"

static NSString *const kMovies = @"movies";

static NSString *const kTitle = @"title";
static NSString *const kDescription = @"description";
static NSString *const kDate = @"date";
static NSString *const kImageName = @"imageName";

@interface MovieLoader()
@property (nonatomic, strong) MoviesJsonData *moviesData;
@end


@implementation MovieLoader

- (NSArray <MovieItem *> *) loadMovies {
    NSArray *movies = [[NSArray alloc] init];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:self.moviesData.jsonData options:0 error:&error];
    
    if (error) {
        NSLog(@"MovieLoader -> loadMovies -> error in serialization");
    }
    
    if ([jsonObject isKindOfClass:[NSDictionary class]]){
        //if movies is a dict then we can do this:
        NSDictionary *obj = jsonObject;
        // in dicts we can get data (movies in this app) in a such way:
        NSArray *moviesDict = obj[kMovies];
        movies = [self parseMoviesFrom:moviesDict];
    }
    
    return movies;
}

- (void) loadMovieWithCompletion:(MoviesBlock)completion {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void){
        completion([self loadMovies]);
    });
}

- (NSArray <MovieItem *> *)parseMoviesFrom:(NSArray *)array {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    // obrabotka massiva slovarey i vozvrat obrabotannyh dannyh
    for (NSDictionary *dict in array) {
        //here we create object of MovieItem
        // for yhis we initialize memory in heap with next fields
        MovieItem *movie = [[MovieItem alloc] initWithTitle:dict[kTitle] description:dict[kDescription] date:dict[kDate] imageName:dict[kImageName]];
        [movies addObject:movie];
    }
    
    
    return [movies copy];  //return unmutable object!!!! (here - NSArray)
}

//lazy constructor for array
- (MoviesJsonData *)moviesData {
    if (!_moviesData) {
        _moviesData = [MoviesJsonData new];
    }
    return _moviesData;
}

@end
