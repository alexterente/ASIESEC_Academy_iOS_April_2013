//
//  Recipe.h
//  recipe
//
//  Created by Alex on 4/6/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

- (id)initWithName:(NSString *)name andDescription:(NSString *)description;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;

@end
