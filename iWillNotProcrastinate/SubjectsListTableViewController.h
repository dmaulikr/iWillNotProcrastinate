//
//  SubjectsListTableViewController.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/8/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "Subject.h"
#import <CoreData/CoreData.h>
#import "AddClassViewController.h"

@interface SubjectsListTableViewController : CoreDataTableViewController <AddClassViewControllerDelegate> {
    NSManagedObjectContext* context;
    Subject *subjectToPass;
}

- initInManagedObjectContext:(NSManagedObjectContext *)context;
-(void)add;
-(void)saveContext;

@property (nonatomic, retain) NSManagedObjectContext*context;
@property (nonatomic, retain) Subject *subjectToPass;

@end