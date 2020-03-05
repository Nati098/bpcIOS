//
//  MovieItem.h
//  Kinopoisk
//
//  Created by Nati on 2/17/20.
//  Copyright © 2020 Nati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieItem : NSObject

@property (nonatomic, strong, readonly) NSString *movieTitle;
@property (nonatomic, strong, readonly) NSString *movieDescription;
@property (nonatomic, strong, readonly) NSString *imageName;
@property (nonatomic, strong, readonly) NSString *date;

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)description date:(NSString *)date imageName:(NSString *)imageName;

@end
