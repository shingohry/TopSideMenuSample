//
//  MenuView.m
//  TopSlideMenuSample
//
//  Created by hiraya.shingo on 2014/03/19.
//  Copyright (c) 2014年 hiraya.shingo. All rights reserved.
//

#import "MenuView.h"

@interface MenuView ()

@property (assign, nonatomic, readwrite) BOOL isMenuOpen;

@end

@implementation MenuView

#pragma mark - UIView methods

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    NSLog(@"awakeFromNib");
    
    // set initial value
    self.isMenuOpen = NO;
}

#pragma mark - public methods

- (void)tappedMenuButton
{
    NSLog(@"MenuView - tappedMenuButton");
    
    if (self.isMenuOpen) {
        [self closeMenuView];
    } else {
        [self openMenuView];
    }
}

#pragma mark - private methods

/**
 *  close MenuView
 */
- (void)closeMenuView
{
    // Set new origin of menu
    CGRect menuFrame = self.frame;
    menuFrame.origin.y = menuFrame.origin.y - 60.0;
    
    [UIView animateWithDuration:0.3f
                          delay:0.05f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.frame = menuFrame;
                     }
                     completion:^(BOOL finished){
                         self.isMenuOpen = NO;
                     }];
    
    [UIView commitAnimations];
}

/**
 *  open MenuView
 */
- (void)openMenuView
{
    // Set new origin of menu
    CGRect menuFrame = self.frame;
    menuFrame.origin.y = menuFrame.origin.y + 60.0;
    
    [UIView animateWithDuration:0.3f
                          delay:0.05f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.frame = menuFrame;
                     }
                     completion:^(BOOL finished){
                         self.isMenuOpen = YES;
                     }];
    
    [UIView commitAnimations];
}

- (void)tappedButtonWithType:(MenuViewSelectedItemType)type
{
    if ([self.delegate respondsToSelector:@selector(menuViewDidSelectedItem:type:)]) {
        [self.delegate menuViewDidSelectedItem:self type:type];
    }
    [self closeMenuView];
}

#pragma mark - Action methods

- (IBAction)tappedLeftButton:(id)sender
{
    [self tappedButtonWithType:MenuViewSelectedItemTypeLeft];
}

- (IBAction)tappedCenterButton:(id)sender
{
    [self tappedButtonWithType:MenuViewSelectedItemTypeCenter];
}

- (IBAction)tappedRightButton:(id)sender
{
    [self tappedButtonWithType:MenuViewSelectedItemTypeRight];
}

@end
