//
//  SelectSubjectTableViewController.m
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/22/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import "SelectSubjectTableViewController.h"
#import "Subject.h"


@implementation SelectSubjectTableViewController
@synthesize context;
@synthesize subjectToPass;
@synthesize delegate;
- initInManagedObjectContext:(NSManagedObjectContext *)passedContext {
    self.context = passedContext;
    if((self = [super initWithStyle:UITableViewStylePlain])) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        request.entity = [NSEntityDescription entityForName:@"Subject" inManagedObjectContext:self.context];
        request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)]];
        request.predicate = nil;
        request.fetchBatchSize = 20;
        
        NSError *error = nil;
        NSArray *photographerArray = [context executeFetchRequest:request error:&error];
		//Note: Must deal with the error
        
        self.subjectToPass = [photographerArray lastObject];
        //[error release];
        //[photographerArray release];
        
        
        NSFetchedResultsController *frc = [[NSFetchedResultsController alloc]
                                           initWithFetchRequest:request
                                           managedObjectContext:self.context
                                           sectionNameKeyPath:nil //I figured out a hack for this to sort like the address book, but honestly, I do not think it is nessecary to have section titles
                                           cacheName:@"SubjectsList"]; //possibly change the nil later?
        
        [request release];
        
        self.fetchedResultsController = frc;
        [frc release];
        
        self.titleKey = @"name";
        self.searchKey = @"name";
    }
    return self;
}

-(void)managedObjectSelected:(NSManagedObject *)managedObject {
    [self.delegate SelectSubject:self returnedSubject:managedObject];
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
