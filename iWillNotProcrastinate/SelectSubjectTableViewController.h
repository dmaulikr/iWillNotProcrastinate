//
//  SelectSubjectTableViewController.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/22/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
@class Subject;
@protocol SelectSubjectDelegate;
@interface SelectSubjectTableViewController : CoreDataTableViewController {
    NSManagedObjectContext* context;
    Subject *subjectToPass;
    id<SelectSubjectDelegate> delegate;
    
}

- initInManagedObjectContext:(NSManagedObjectContext *)context;


@property (nonatomic, retain) NSManagedObjectContext*context;
@property (nonatomic, retain) Subject *subjectToPass;
@property (assign) id<SelectSubjectDelegate> delegate;


@end

@protocol SelectSubjectDelegate
-(void)SelectSubject:(SelectSubjectTableViewController *)sender returnedSubject:(NSManagedObject *)subject;
@end

