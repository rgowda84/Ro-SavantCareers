//
//  JobListingTableViewController.m
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/21/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import "JobListingTableViewController.h"
#import "Positions.h"
#import "PostionsTableViewCell.h"
#import "JobDetailsTableViewController.h"

@interface JobListingTableViewController ()

@property (nonatomic, strong) NSMutableArray *arrayOfPositions;
@property (nonatomic, strong) JobDetailsTableViewController *jobDetailsVC;

@end

@implementation JobListingTableViewController
{
    NSArray *positionTitle;
    NSArray *positionLoc;
    NSArray *positionDesc;
    NSArray *responsibility;
    NSArray *qualification;
    NSArray *additionalQualification;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //This is to set tableview coordinates, so that it doesnt hide behind navcontroller.
    UIEdgeInsets inset = UIEdgeInsetsMake(60, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    [self setUpJobListingsArray];
    
}

- (void) setUpJobListingsArray{
    
    //The path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"positionDetails" ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    positionTitle = [dict objectForKey:@"PositionTitle"];
    positionLoc = [dict objectForKey:@"PositionLocation"];
    positionDesc = [dict objectForKey:@"PositionDesc"];
    responsibility = [dict objectForKey:@"PositionResponsibility"];
    qualification = [dict objectForKey:@"PositionQualification"];
    additionalQualification = [dict objectForKey:@"PositionAdditionalQualification"];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [positionTitle count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70; //Or we can even set accoring to the "return cellPositions.frame.size.height;" if it was declared as a property.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellPositionsID";
    PostionsTableViewCell *cellPositions = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cellPositions == nil ) {
        NSArray *tableCellNib = [[NSBundle mainBundle] loadNibNamed:@"PostionsTableViewCell" owner:self options:nil];
        cellPositions = (PostionsTableViewCell *)tableCellNib[0];
        [cellPositions setBackgroundColor:[UIColor whiteColor]];
        
        [cellPositions.positionTitle setTextColor:[UIColor colorWithRed:(74/255.f) green:(186/255.f) blue:(255/255.f) alpha:1.0f]];
        [cellPositions.positionLocation setTextColor:[UIColor grayColor]];
    }

    //Positions *currentPosition = [self.arrayOfPositions objectAtIndex:indexPath.row];
    cellPositions.positionTitle.text = [positionTitle objectAtIndex:indexPath.row];
    cellPositions.positionLocation.text = [positionLoc objectAtIndex:indexPath.row];

    return cellPositions;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _jobDetailsVC = [[JobDetailsTableViewController alloc] initWithNibName:@"JobDetailsTableViewController" bundle:nil];
    _jobDetailsVC.jobtitle = [positionTitle objectAtIndex:indexPath.row];
    _jobDetailsVC.location = [positionLoc objectAtIndex:indexPath.row];
    _jobDetailsVC.description = [positionDesc objectAtIndex:indexPath.row];
    _jobDetailsVC.responsibility = [responsibility objectAtIndex:indexPath.row];
    _jobDetailsVC.qualification = [qualification objectAtIndex:indexPath.row];
    _jobDetailsVC.addQualification = [additionalQualification objectAtIndex:indexPath.row];
    
    
//    NSDictionary *dict = [recipeNames objectAtIndex:indexPath.row];
//    destViewController.recipeName = [dict valueForKey:@"Recipie Name"];
    
    [self.navigationController pushViewController:_jobDetailsVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
