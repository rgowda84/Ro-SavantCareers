//
//  JobDetailsTableViewController.m
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/21/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import "JobDetailsTableViewController.h"
#import "CustomJobDetailsTableViewCell.h"

@interface JobDetailsTableViewController ()

@end

@implementation JobDetailsTableViewController
{
    NSString *responsibilityString;
    NSString *qualificationString;
    NSString *addQualificationString;
    NSArray *tableData;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _selectedIndex = -1;
    _positionTitle.text = _jobtitle;
    _positionLocation.text = _location;
    
    responsibilityString = @"";
    qualificationString = @"";
    addQualificationString = @"";
    
   tableData = [NSArray arrayWithObjects:@"Description", @"Responsibility", @"Qualification", @"Additional Qualification", nil];
}

-(CGFloat)getLabelHeightForIndex:(NSString*)string
{
    CGSize size = CGSizeMake(320,9999);
    CGRect textSize = [string
                       boundingRectWithSize:size
                       options:NSStringDrawingUsesLineFragmentOrigin
                       attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:14.0f] }
                       context:nil];
    
    return textSize.size.height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rowcount = 0;
    if(_descp != nil){
        rowcount++;
    }
    if([_responsibility count] > 0){
        rowcount++;
    }
    if([_qualification count] > 0){
        rowcount++;
    }
    if([_addQualification count] > 0){
        rowcount++;
    }
    return rowcount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    static NSString *cellID = @"cellID";
//    
//    CustomJobDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    
//    if (cell == nil) {
//        NSArray *tableCellNib = [[NSBundle mainBundle] loadNibNamed:@"CustomJobDetailsTableViewCell" owner:self options:nil];
//           cell = (CustomJobDetailsTableViewCell *)tableCellNib[0];
//    }
//    if(indexPath.row == 0){
//     cell.header.text = [tableData objectAtIndex:indexPath.row];
//    } else if(indexPath.row == 1){
//        cell.header.text = [tableData objectAtIndex:indexPath.row];
//    } else if(indexPath.row == 2 ){
//        cell.header.text = [tableData objectAtIndex:indexPath.row];
//    } else {
//        cell.header.text = [tableData objectAtIndex:indexPath.row];
//    }
//    return cell;
    
    static NSString *cellID = @"cellID";
    CustomJobDetailsTableViewCell *cellDetails = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cellDetails == nil ) {
        NSArray *tableCellNib = [[NSBundle mainBundle] loadNibNamed:@"CustomJobDetailsTableViewCell" owner:self options:nil];
        
        cellDetails = (CustomJobDetailsTableViewCell *)tableCellNib[0];
        [cellDetails setBackgroundColor:[UIColor whiteColor]];
    }
    if(indexPath.row == 0){
        cellDetails.header.text = @"Description";
        cellDetails.details.text = _descp;
       
        CGFloat labelHeight = [self getCellFrameForIndex:indexPath.row withString:_descp];
        cellDetails.details.frame = CGRectMake(cellDetails.details.frame.origin.x,
                                               cellDetails.details.frame.origin.y,
                                               cellDetails.details.frame.size.width,
                                               labelHeight);
    } else if(indexPath.row == 1){
        int i;
        for(i=0; i< [_responsibility count]; i++){
            responsibilityString = [responsibilityString stringByAppendingString:[NSString stringWithFormat: @"- %@\n", [_responsibility objectAtIndex:i]]];
        }
        
        CGFloat labelHeight = [self getCellFrameForIndex:indexPath.row withString:responsibilityString];
        cellDetails.details.frame = CGRectMake(cellDetails.details.frame.origin.x,
                                               cellDetails.details.frame.origin.y,
                                               cellDetails.details.frame.size.width,
                                               labelHeight);
        cellDetails.header.text  = @"Responsibility";
        cellDetails.details.text = responsibilityString;
        NSLog(@"The complete string is %@", responsibilityString);
        
    } else if (indexPath.row == 2){
        int i;
        for(i=0; i< [_qualification count]; i++){
            qualificationString = [qualificationString stringByAppendingString:[NSString stringWithFormat: @"- %@\n", [_qualification objectAtIndex:i]]];
        }
        CGFloat labelHeight = [self getCellFrameForIndex:indexPath.row withString:qualificationString];
        cellDetails.details.frame = CGRectMake(cellDetails.details.frame.origin.x,
                                               cellDetails.details.frame.origin.y,
                                               cellDetails.details.frame.size.width,
                                               labelHeight);
        cellDetails.details.text = qualificationString;
        cellDetails.header.text  = @"Qualification";

        
    } else if (indexPath.row == 3){
        int i;
        for(i=0; i< [_addQualification count]; i++){
            addQualificationString = [addQualificationString stringByAppendingString:[NSString stringWithFormat: @"- %@\n", [_addQualification objectAtIndex:i]]];
        }
        
        CGFloat labelHeight = [self getCellFrameForIndex:indexPath.row withString:addQualificationString];
        cellDetails.details.frame = CGRectMake(cellDetails.details.frame.origin.x,
                                               cellDetails.details.frame.origin.y,
                                               cellDetails.details.frame.size.width,
                                               labelHeight);
        cellDetails.details.text = addQualificationString;
        cellDetails.header.text  = @"Additional Qualification";
    }
    return cellDetails;
}

-(CGFloat)getCellFrameForIndex:(NSInteger)index withString:(NSString *)string
{
    CGFloat labelHeight;
    if(_selectedIndex == index)
    {
        labelHeight = [self getLabelHeightForIndex:string];
    } else {
        labelHeight = 60;
    }
    return labelHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0){
        if(_selectedIndex == indexPath.row)
        {
            return [self getLabelHeightForIndex:_descp] + 10 * 2;
        }
        else {
            return 70 + 10 * 2;
        }
    } else if(indexPath.row == 1){
        if(_selectedIndex == indexPath.row)
        {
            return [self getLabelHeightForIndex:responsibilityString] + 10 * 2;
        }
        else {
            return 70 + 10 * 2;
        }
    } else if(indexPath.row == 2){
        if(_selectedIndex == indexPath.row)
        {
            return [self getLabelHeightForIndex:qualificationString] + 10 * 2;
        }
        else {
            return 70 + 10 * 2;
        }
    } else {
        if(_selectedIndex == indexPath.row)
        {
            return [self getLabelHeightForIndex:addQualificationString] + 10 * 2;
        } else {
            return 70 + 10 * 2;
        }
    }
}

//-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //We only don't want to allow selection on any cells which cannot be expanded
//    if([self getLabelHeightForIndex:_description] > 60)
//    {
//        return indexPath;
//    }
//    else {
//        return nil;
//    }
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //The user is selecting the cell which is currently expanded
    //we want to minimize it back
    if(_selectedIndex == indexPath.row)
    {
        _selectedIndex = -1;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        return;
    }
    
    //First we check if a cell is already expanded.
    //If it is we want to minimize make sure it is reloaded to minimize it back
    if(_selectedIndex >= 0)
    {
        NSIndexPath *previousPath = [NSIndexPath indexPathForRow:_selectedIndex inSection:0];
        _selectedIndex = indexPath.row;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:previousPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    //Finally set the selected index to the new selection and reload it to expand
    _selectedIndex = indexPath.row;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
