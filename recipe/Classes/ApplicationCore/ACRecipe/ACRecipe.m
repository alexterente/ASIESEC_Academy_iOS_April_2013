//
//  Recipe.m
//  recipe
//
//  Created by Alex on 4/6/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ACRecipe.h"

@implementation ACRecipe

- (id)initWithName:(NSString *)name andDescription:(NSString *)description{
    self = [self init];
    self.name = name;
    self.description = description;
    return self;
}

@end
