//
//  MainViewController.m
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/20/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//


#import "MainViewController.h"
#import "SavantSystemMainView.h"
#import "MenuTableViewController.h"
#import <QuartzCore/QuartzCore.h>

#define CENTER_TAG 1
#define LEFT_PANEL_TAG 2
#define CORNER_RADIUS 4
#define SLIDE_TIMING .25
#define PANEL_WIDTH 60

@interface MainViewController () <SavantMainViewControllerDelegate>

@property (nonatomic, strong) SavantSystemMainView *savantMainViewController;
@property (nonatomic, strong) MenuTableViewController *menuTableViewController;
@property (nonatomic, assign) BOOL showingLeftPanel;
@property (nonatomic, strong) UIBarButtonItem *btnMenu;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _btnMenu = [[UIBarButtonItem alloc]
                initWithTitle:@"Menu"
                style:UIBarButtonItemStyleBordered
                target:self
                action:@selector(btnMovePanelRight:)];
    _btnMenu.tag = 1;
    self.navigationItem.leftBarButtonItem = _btnMenu;
    
    [self setupView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark -
#pragma mark Setup View

- (void)setupView
{
    
    self.savantMainViewController = [[SavantSystemMainView alloc] initWithNibName:@"SavantSystemMainView" bundle:nil];
    self.savantMainViewController.view.tag = CENTER_TAG;
    self.savantMainViewController.delegate = self;
    
    [self.view addSubview:self.savantMainViewController.view];
    [self addChildViewController:_savantMainViewController];
    
    [_savantMainViewController didMoveToParentViewController:self];
}

- (void)btnMovePanelRight:(id)sender
{
    UIButton *button = sender;
    switch (button.tag) {
        case 0: {
            [self movePanelToOriginalPosition];
            break;
        }
            
        case 1: {
            [self movePanelRight];
            break;
        }
            
        default:
            break;
    }
}

- (void)showCenterViewWithShadow:(BOOL)value withOffset:(double)offset
{
    if (value)
    {
        [_savantMainViewController.view.layer setCornerRadius:CORNER_RADIUS];
        [_savantMainViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];
        [_savantMainViewController.view.layer setShadowOpacity:0.8];
        [_savantMainViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
        
    }
    else
    {
        [_savantMainViewController.view.layer setCornerRadius:0.0f];
        [_savantMainViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
    }
}

- (void)resetMainView
{
    // remove left view and reset variables, if needed
    if (_menuTableViewController != nil)
    {
        [self.menuTableViewController.view removeFromSuperview];
        self.menuTableViewController = nil;
        
        _btnMenu.tag = 1;
        self.showingLeftPanel = NO;
    }
    
    // remove view shadows
    [self showCenterViewWithShadow:NO withOffset:0];
}

- (UIView *)getLeftView
{
    // init view if it doesn't already exist
    if (_menuTableViewController == nil)
    {
        // this is where you define the view for the left panel
        self.menuTableViewController = [[MenuTableViewController alloc] initWithNibName:@"MenuTableViewController" bundle:nil];
        self.menuTableViewController.view.tag = LEFT_PANEL_TAG;
        self.menuTableViewController.delegate = _savantMainViewController;
        [self.view addSubview:self.menuTableViewController.view];
        
        [self addChildViewController:_menuTableViewController];
        [_menuTableViewController didMoveToParentViewController:self];
        
        _menuTableViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    
    self.showingLeftPanel = YES;
    
    // set up view shadows
    [self showCenterViewWithShadow:YES withOffset:-2];
    
    UIView *view = self.menuTableViewController.view;
    return view;
    
}

#pragma mark -
#pragma mark Delegate Actions

- (void)movePanelRight // to show left panel
{
    UIView *childView = [self getLeftView];
    [self.view sendSubviewToBack:childView];
    
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         _savantMainViewController.view.frame = CGRectMake(self.view.frame.size.width - PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             _btnMenu.tag = 0;
                         }
                     }];
}

- (void)movePanelToOriginalPosition
{
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         _savantMainViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             [self resetMainView];
                         }
                     }];
}

#pragma mark -
#pragma mark Default System Code

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
