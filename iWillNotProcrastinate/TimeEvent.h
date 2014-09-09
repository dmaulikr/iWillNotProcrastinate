//
//  TimeEvent.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/8/11.
//  Copyright (c) 2011 BigMeierHouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subject;

@interface TimeEvent : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * timePlanned;
@property (nonatomic, retain) NSNumber * timeTook;
@property (nonatomic, retain) NSDate * dateOccured;
@property (nonatomic, retain) Subject * forSubject;

@end
