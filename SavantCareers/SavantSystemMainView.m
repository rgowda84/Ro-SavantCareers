//
//  SavantSystemMainView.m
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/20/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import "SavantSystemMainView.h"
#import "JobListingTableViewController.h"

#import "Positions.h"

@interface SavantSystemMainView ()

@property (nonatomic, strong) JobListingTableViewController *jobListingTVC;

@end

@implementation SavantSystemMainView

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

//#pragma mark -
//#pragma mark Button Actions
//
//- (IBAction)btnMovePanelRight:(id)sender
//{
//    UIButton *button = sender;
//    switch (button.tag) {
//        case 0: {
//            [_delegate movePanelToOriginalPosition];
//            break;
//        }
//            
//        case 1: {
//            [_delegate movePanelRight];
//            break;
//        }
//            
//        default:
//            break;
//    }
//}

- (void)setUpCareerView{
    self.jobListingTVC = [[JobListingTableViewController alloc] initWithNibName:@"JobListingTableViewController" bundle:nil];
    //self.jobListingTVC.view.tag = CENTER_TAG;
    //self.jobListingTVC.delegate = self;
    
    [self.view addSubview:self.jobListingTVC.view];
    [self addChildViewController:_jobListingTVC];
    
    [_delegate movePanelToOriginalPosition];
    
    //[_jobListingTVC didMoveToParentViewController:self];
}

-(void)setUpHome{
    [_delegate setupView];
}


#pragma mark -
#pragma mark Delagate Method for capturing selected image

/*
 note: typically, you wouldn't create "duplicate" delagate methods, but we went with simplicity.
 doing it this way allowed us to show how to use the #define statement and the switch statement.
 */

//- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator
//{
//    // only change the main display if an animal/image was selected
//    if (image)
//    {
//        self.mainImageView.image = image;
//        self.imageTitle.text = [NSString stringWithFormat:@"%@", imageTitle];
//        self.imageCreator.text = [NSString stringWithFormat:@"%@", imageCreator];
//    }
//}
//
//- (void)animalSelected:(Animal *)animal
//{
//    // only change the main display if an animal/image was selected
//    if (animal)
//    {
//        [self showAnimalSelected:animal];
//    }
//}
//
//// setup the imageview with our selected animal
//- (void)showAnimalSelected:(Animal *)animalSelected
//{
//    self.mainImageView.image = animalSelected.image;
//    self.imageTitle.text = [NSString stringWithFormat:@"%@", animalSelected.title];
//    self.imageCreator.text = [NSString stringWithFormat:@"%@", animalSelected.creator];
//}

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