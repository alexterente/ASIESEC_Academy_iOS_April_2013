//
//  UIDetailedRecipeViewController.m
//  recipe
//
//  Created by Alex on 4/13/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "UIDetailedRecipeViewController.h"

#define kPadding 5

@interface UIDetailedRecipeViewController (){
    UIImageView *imageView;
    UIScrollView *scrollView;
    UITextView *testView;
}

@end

@implementation UIDetailedRecipeViewController

#pragma mark - ViewSetUp Methods

- (UIScrollView *)createScrollView{
    CGRect scrollViewFrame = CGRectMake(kPadding,
                                        kPadding,
                                        self.view.frame.size.width - 2*kPadding,
                                        200);
    UIScrollView *returndScrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    returndScrollView.scrollEnabled = YES;
    returndScrollView.maximumZoomScale = 2.0;
    returndScrollView.minimumZoomScale = 0.1;
    returndScrollView.zoomScale = 0.3;
    returndScrollView.delegate = self;
    return returndScrollView;
}

- (UIImageView *)setUpImageViewInScrollView:(UIScrollView *)aScrollView
                                  withImage:(UIImage *)aImage{
    UIImageView  *returndImageView = [[UIImageView alloc] initWithImage:aImage];
    [aScrollView addSubview:returndImageView];
    aScrollView.contentSize = returndImageView.frame.size;
    return returndImageView;
}


- (UITextView *)createTextViewWithText:(NSString *)aText andFrame:(CGRect)frame{
    UITextView *returndTextView = [[UITextView alloc] initWithFrame:frame];
    returndTextView.text = aText;
    returndTextView.textColor = [UIColor whiteColor];
    returndTextView.backgroundColor = [UIColor darkGrayColor];
    returndTextView.editable = NO;
    returndTextView.scrollEnabled = YES;
    returndTextView.layer.borderWidth = 1;
    returndTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    returndTextView.layer.masksToBounds = YES;
    returndTextView.layer.cornerRadius = 5.0;
    return returndTextView;
}


#pragma mark - ViewLifeCircle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    scrollView = [self createScrollView];
    [self.view addSubview:scrollView];
    imageView = [self setUpImageViewInScrollView:scrollView
                                       withImage:[UIImage imageNamed:_currentRecipe.photoName]];
    self.view.backgroundColor = [UIColor blackColor];
    
    CGFloat textViewYValue = scrollView.frame.size.height +
                             scrollView.frame.origin.y +
                             kPadding;
    CGFloat textViewWidth = self.view.frame.size.width - (2*kPadding);
    CGRect textViewFrame = CGRectMake(kPadding,
                                      textViewYValue,
                                      textViewWidth,
                                      150);
    testView = [self createTextViewWithText:_currentRecipe.description
                                   andFrame:textViewFrame];
    [self.view addSubview:testView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegates
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView;
}


@end
