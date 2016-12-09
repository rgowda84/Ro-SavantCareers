//
//  JobDetailsTableViewController.h
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/21/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobDetailsTableViewController : UITableViewController

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *positionTitle;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *positionLocation;

@property (strong, nonatomic) NSMutableArray *selectedPosition;
@property (strong, nonatomic) NSString *jobtitle;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *descp;
@property (strong, nonatomic) NSArray *responsibility;
@property (strong, nonatomic) NSArray *qualification;
@property (strong, nonatomic) NSArray *addQualification;
@property (nonatomic, assign) NSInteger selectedIndex;


@end
