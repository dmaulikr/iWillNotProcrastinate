//
//  TimeEventsTableViewController.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/10/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"
#import "CoreDataTableViewController.h"
#import <CoreData/CoreData.h>

@interface TimeEventsTableViewController : CoreDataTableViewController {
}
-(id)initInManagedObjectContext:(NSManagedObjectContext *)context withSubject:(Subject *)theSubject;

@end
