//
//  SubjectsListTableViewController.m
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/8/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import "SubjectsListTableViewController.h"
#import "SubjectsListDetailViewController.h"
#import "Subject.h"


@implementation SubjectsListTableViewController
@synthesize context;
@synthesize subjectToPass;
-(void)viewDidLoad {
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}
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
        UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
        self.navigationItem.rightBarButtonItem = addButtonItem;
    }
    return self;
}

- (void)managedObjectSelected:(NSManagedObject *)managedObject
{
    //method definiton for below:
    //         -(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withSubject:(Subject *)theSubject;
    SubjectsListDetailViewController *sldvc = [[SubjectsListDetailViewController alloc] initWithNibName:@"SubjectslistDetailViewController" bundle:nil withSubject:self.subjectToPass]; //bundle:nil implies default bundle  
    sldvc.context = self.context;
    [self.navigationController pushViewController:sldvc animated:YES];
    [sldvc release];
}

-(void)add {
    AddClassViewController *acvc = [[AddClassViewController alloc] init];
    acvc.delegate = self;
    [self presentModalViewController:acvc animated:YES];
}
-(void)AddClassViewController:(AddClassViewController *)sender gotSubject:(NSString *)subject andTeacher:(NSString *)teacher {
    [sender dismissModalViewControllerAnimated:YES];
    [Subject subjectWithName:subject andTeacher:teacher inManagedObjectContext:self.context];
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.context; //Need to release this?  I don't think so because I didn't allocate anything and this is simply a pointer
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	Subject *managedObject = [[self fetchedResultsControllerForTableView:tableView] objectAtIndexPath:indexPath];
    NSLog(@"You want to delete the subject name: %@", managedObject);
    [managedObject removeTimeEvents:nil];
    NSLog(@"You want to delete the subject name: %@", managedObject);

	[self deleteManagedObject:managedObject];
    NSLog(@"You want to delete the subject name: %@", managedObject);
    [self saveContext];

}


- (BOOL)canDeleteManagedObject:(NSManagedObject *)managedObject {
    return YES;
}



@end
