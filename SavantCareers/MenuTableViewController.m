//
//  MenuTableViewController.m
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/20/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import "MenuTableViewController.h"
#import "Positions.h"
#import "PostionsTableViewCell.h"

@interface MenuTableViewController ()

@property (nonatomic, strong) NSMutableArray *menuArray;

@end

@implementation MenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //This is to set tableview coordinates, so that it doesnt hide behind navcontroller.
    UIEdgeInsets inset = UIEdgeInsetsMake(60, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    [self setupArray];
}


#pragma mark -
#pragma mark Array Setup

- (void)setupArray
{    
    _menuArray = [NSMutableArray arrayWithObjects:@"Home", @"Awards", @"Careers", @"Connect with Us", @"Partners", @"Savant & Apple", nil];
    
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark UITableView Datasource/Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menuArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellPositionsID";
    PostionsTableViewCell *cellPositions = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cellPositions == nil ) {
        NSArray *tableCellNib = [[NSBundle mainBundle] loadNibNamed:@"PostionsTableViewCell" owner:self options:nil];
        cellPositions = (PostionsTableViewCell *)tableCellNib[0];
        //[cellPositions setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if ([_menuArray count] > 0)
    {
        cellPositions.positionTitle.text = [_menuArray objectAtIndex:indexPath.row];
        [cellPositions.positionLocation setHidden:YES];
//        Positions *currentPosition = [self.arrayOfPositions objectAtIndex:indexPath.row];
//        cellPositions.positionTitle.text = currentPosition.positionTitle;
//        cellPositions.positionLocation.text = currentPosition.positionLocation;
        
    }

    return cellPositions;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    Animal *currentRecord = [self.arrayOfAnimals objectAtIndex:indexPath.row];
//    [_delegate animalSelected:currentRecord];
    
    NSString *currentSelection = [self.menuArray objectAtIndex:indexPath.row];
    NSLog(@"my current seelction is: %@", currentSelection);
    
    if([currentSelection isEqualToString:@"Home"]){
        [_delegate setUpHome];
    }
    if([currentSelection isEqualToString:@"Awards"]){
        
    }

    if([currentSelection isEqualToString:@"Careers"]){
        [_delegate setUpCareerView];
    }

    if([currentSelection isEqualToString:@"Connect with Us"]){
        
    }

    if([currentSelection isEqualToString:@"Partners"]){
        
    }

    if([currentSelection isEqualToString:@"Savant & Apple"]){
        
    }
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
