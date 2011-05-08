//
//  iWillNotProcrastinateAppDelegate.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/8/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iWillNotProcrastinateAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
