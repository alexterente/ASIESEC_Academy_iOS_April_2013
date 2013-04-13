//
//  UIDetailedRecipeViewController.h
//  recipe
//
//  Created by Alex on 4/13/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "ACRecipe.h"

@interface UIDetailedRecipeViewController : UIViewController <UIScrollViewAccessibilityDelegate>

@property (nonatomic, strong) ACRecipe *currentRecipe;

@end
