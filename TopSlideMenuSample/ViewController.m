//
//  ViewController.m
//  TopSlideMenuSample
//
//  Created by hiraya.shingo on 2014/03/19.
//  Copyright (c) 2014年 hiraya.shingo. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"

@interface ViewController () <MenuViewDelegate>

@property (strong, nonatomic) MenuView *menuView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIView *overlayView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // メニュービュー
    self.menuView = [[[NSBundle mainBundle] loadNibNamed:@"MenuView"
                                                   owner:self
                                                 options:nil] lastObject];
    self.menuView.delegate = self;
    [self.view addSubview:self.menuView];
}

- (IBAction)tappedMenuButton:(id)sender
{
    if (self.menuView.isMenuOpen) {
        [self hiddenOverlayView];
    } else {
        [self showOverlayView];
    }
    
    [self.menuView tappedMenuButton];
}

- (void)menuViewDidSelectedItem:(MenuView *)menuView type:(MenuViewSelectedItemType)type
{
    switch (type) {
        case MenuViewSelectedItemTypeLeft:
            self.label.text = @"selected LeftButton";
            break;
        
        case MenuViewSelectedItemTypeCenter:
            self.label.text = @"selected CenterButton";
            break;
        
        case MenuViewSelectedItemTypeRight:
        default:
            self.label.text = @"selected RightButton";
            break;
    }
    [self hiddenOverlayView];
}

- (void)showOverlayView
{
    self.overlayView.hidden = NO;
    self.overlayView.alpha = 0.0;
    
    [UIView animateWithDuration:0.3f
                          delay:0.05f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.overlayView.alpha = 0.5;
                     }
                     completion:^(BOOL finished){
                     }];
    
    [UIView commitAnimations];
}

- (void)hiddenOverlayView
{
    self.overlayView.alpha = 0.5;
    
    [UIView animateWithDuration:0.3f
                          delay:0.05f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.overlayView.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         self.overlayView.hidden = YES;
                     }];
    
    [UIView commitAnimations];
}

@end
