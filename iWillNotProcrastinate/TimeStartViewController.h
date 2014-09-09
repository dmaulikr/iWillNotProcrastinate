//
//  TimeStartViewController.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/20/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectSubjectTableViewController.h"

@interface TimeStartViewController : UIViewController <SelectSubjectDelegate> {
    NSTimeInterval estimatedTime;
    BOOL timeSelectIsUp;
    UIDatePicker *datePicker;
    NSManagedObjectContext *context;
    BOOL timerRunning;
    NSTimer *repeatTimer;
    
    
    IBOutlet UIButton *startStopButton;
    IBOutlet UIButton *resetSaveButton;
    IBOutlet UILabel *timeLeft;
}

-(IBAction)selectTime;
-(IBAction)selectSubject;
-(IBAction)startTime;
-(IBAction)resetSaveTime;

-(void)removeDatePickerFromSubview:(UIDatePicker *)dateP;
-(void)removeDatePicker:(UIDatePicker *)dateP;
-(void)changedTime:(id)sender;


@property (assign) NSTimeInterval estimatedTime;
@property (assign) BOOL timeSelectIsUp;
@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) IBOutlet UIButton *startStopButton;
@property (nonatomic, retain) IBOutlet UIButton *resetSaveButton;
@property (assign) BOOL timerRunning;
@property (nonatomic, retain) IBOutlet UILabel *timeLeft;
@property (nonatomic, retain) NSTimer *repeatTimer;

@end
