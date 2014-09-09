//
//  TimeEventsTableViewController.m
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/10/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import "TimeEventsTableViewController.h"
#import "Subject.h"
#import "SubjectsListDetailViewController.h"


@implementation TimeEventsTableViewController

-(id)initInManagedObjectContext:(NSManagedObjectContext *)context withSubject:(Subject *)theSubject {
    if((self = [super initWithStyle:UITableViewStylePlain])) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        request.entity = [NSEntityDescription entityForName:@"TimeEvent" inManagedObjectContext:context];
        request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"dateOccured" ascending:YES]];
        
        request.predicate = [NSPredicate predicateWithFormat:@"forSubject = %@", theSubject];
        request.fetchBatchSize = 20;
        
        NSFetchedResultsController *frc = [[NSFetchedResultsController alloc]
                                           initWithFetchRequest:request
                                           managedObjectContext:context
                                           sectionNameKeyPath:nil //I figured out a hack for this to sort like the address book, but honestly, I do not think it is nessecary to have section titles
                                           cacheName:@"TimeEventsList"]; //possibly change the nil later?
        
        [request release];
        
        self.fetchedResultsController = frc;
        [frc release];
        
        self.titleKey = @"timePlanned";
    }
    return self;
}

- (void)managedObjectSelected:(NSManagedObject *)managedObject {
    SubjectsListDetailViewController *sldvc = [[SubjectsListDetailViewController alloc] init];
    [self.navigationController pushViewController:sldvc animated:YES];
}

@end
