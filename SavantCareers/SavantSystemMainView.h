//
//  SavantSystemMainView.h
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/20/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import "MenuTableViewController.h"

@protocol SavantMainViewControllerDelegate <NSObject>

@optional
- (void)movePanelLeft;
- (void)movePanelRight;

@required
- (void)movePanelToOriginalPosition; //moveToOriginalPosition
- (void)setupView;

@end


@interface SavantSystemMainView : UIViewController <MenuDelegate>

@property (nonatomic, assign) id<SavantMainViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIButton *menuButton;

@end
