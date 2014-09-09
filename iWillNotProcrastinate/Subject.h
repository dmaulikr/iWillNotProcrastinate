//
//  Subject.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/8/11.
//  Copyright (c) 2011 BigMeierHouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TimeEvent;

@interface Subject : NSManagedObject {
@private
}

+ (Subject *)subjectWithName:(NSString *)name andTeacher:(NSString *)teacher inManagedObjectContext: (NSManagedObjectContext *) context;

@property (nonatomic, retain) NSString * teacher;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* timeEvents;

@end

//I am not sure why CoreData did not automatically generate below, but I rewrote it by hand the same way it should have been
@interface Subject (CoreDataGeneratedAccessors)
- (void)addTimeEventsObject:(TimeEvent *)value;
- (void)removeTimeEventsObject:(TimeEvent *)value;
- (void)addTimeEvents:(NSSet *)value;
- (void)removeTimeEvents:(NSSet *)value;
@end