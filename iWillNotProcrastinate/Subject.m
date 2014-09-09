//
//  Subject.m
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/8/11.
//  Copyright (c) 2011 BigMeierHouse. All rights reserved.
//

#import "Subject.h"
#import "TimeEvent.h"


@implementation Subject
@dynamic teacher;
@dynamic name;
@dynamic timeEvents;

+ (Subject *)subjectWithName:(NSString *)name andTeacher:(NSString *)teacher inManagedObjectContext: (NSManagedObjectContext *) context {
    //First check to make sure this subject has not been created yet.  Possibly tell the user that their subject has already been created and throw some type of visual error?
    Subject *newSubject = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Subject" inManagedObjectContext:context];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@ AND teacher = %@", name, teacher];
    
    NSError *error = nil;
    newSubject = [[context executeFetchRequest:request error:&error] lastObject];
    [request release];
    
    if(!error && !newSubject) {
        newSubject = [NSEntityDescription insertNewObjectForEntityForName:@"Subject" inManagedObjectContext:context];
        newSubject.name = name;
        newSubject.teacher = teacher;
    }
    
    return newSubject;
    
}

- (void)addTimeEventsObject:(TimeEvent *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"timeEvents" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"timeEvents"] addObject:value];
    [self didChangeValueForKey:@"timeEvents" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeTimeEventsObject:(TimeEvent *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"timeEvents" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"timeEvents"] removeObject:value];
    [self didChangeValueForKey:@"timeEvents" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addTimeEvents:(NSSet *)value {    
    [self willChangeValueForKey:@"timeEvents" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"timeEvents"] unionSet:value];
    [self didChangeValueForKey:@"timeEvents" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeTimeEvents:(NSSet *)value {
    [self willChangeValueForKey:@"timeEvents" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"timeEvents"] minusSet:value];
    [self didChangeValueForKey:@"timeEvents" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
