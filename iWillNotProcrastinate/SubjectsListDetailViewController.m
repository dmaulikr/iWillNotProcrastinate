//
//  SubjectsListDetailViewController.m
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/10/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import "SubjectsListDetailViewController.h"
#import "TimeEventsTableViewController.h"


@implementation SubjectsListDetailViewController
@synthesize backButton;
@synthesize subject;
@synthesize segmentControl;
@synthesize context;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withSubject:(Subject *)theSubject {
    self.subject = theSubject;
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //backButton = 
    TimeEventsTableViewController *tetvc = [[TimeEventsTableViewController alloc] initInManagedObjectContext:self.context withSubject:self.subject];
    segmentControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Graph", @"Table", nil]]; 
    
    [tetvc release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
