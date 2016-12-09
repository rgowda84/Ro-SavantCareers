//
//  MenuTableViewController.h
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/20/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Positions;

@protocol MenuDelegate <NSObject>

@optional
- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator;

@required
- (void)setUpCareerView;
- (void)setUpHome;

@end

@interface MenuTableViewController : UITableViewController

@property (nonatomic, assign) id<MenuDelegate> delegate;

@end








