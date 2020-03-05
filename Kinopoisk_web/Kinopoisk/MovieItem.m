//
//  MovieItem.m
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import "MovieItem.h"

@interface MovieItem()
@property (nonatomic, strong, readwrite) NSString *movieTitle;
@property (nonatomic, strong, readwrite) NSString *movieDescription;
@property (nonatomic, strong, readwrite) NSString *imageName;
@property (nonatomic, strong, readwrite) NSString *date;
@end

@implementation MovieItem

// initializer
- (instancetype)initWithTitle:(NSString *)title description:(NSString *)description date:(NSString *)date imageName:(NSString *)imageName {
    
    self = [super init];
    if (self) { //if self has initialized
        //set elements
        self.movieTitle = title;
        self.movieDescription = description;
        _date = date;
        _imageName = imageName; //2nd way to get self fields
    }
    
    return self;
}


@end
