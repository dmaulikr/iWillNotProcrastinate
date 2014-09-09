//
//  TimeStartViewController.m
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/20/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import "TimeStartViewController.h"


@implementation TimeStartViewController
@synthesize estimatedTime;
@synthesize timeSelectIsUp;
@synthesize datePicker;
@synthesize context;
@synthesize startStopButton, resetSaveButton;
@synthesize timerRunning;
@synthesize timeLeft;
@synthesize repeatTimer;
#pragma mark - my own stuff

-(IBAction)selectSubject{
    SelectSubjectTableViewController *selectSubjectCtrl = [[SelectSubjectTableViewController alloc] initInManagedObjectContext:self.context];
    selectSubjectCtrl.delegate = self;
    [self presentModalViewController:selectSubjectCtrl animated:YES];
}
-(IBAction)selectTime {
    if(!timeSelectIsUp) {
        CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height-216, 320, 216);
        UIDatePicker *datepicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
        [datepicker addTarget:self action:@selector(changedTime:) forControlEvents:UIControlEventValueChanged];
        datepicker.datePickerMode = UIDatePickerModeCountDownTimer;
        datepicker.minuteInterval = 1;
    
        [self.view addSubview:datepicker];
    
        [UIView beginAnimations:@"SlideInDatePicker" context:nil];
        datepicker.frame = datePickerTargetFrame;
        [UIView commitAnimations];
        self.timeSelectIsUp = true;
        
        self.datePicker = datepicker;
    
    }   
    else {
        [self removeDatePicker:self.datePicker];
    }
}

-(void)changedTime:(id)sender {
    self.estimatedTime = [sender countDownDuration];
}

-(void)removeDatePicker:(UIDatePicker *)dateP {
    [UIView beginAnimations:@"MoveOut" context:nil];
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height+44, 320, 216);
    dateP.frame = datePickerTargetFrame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeDatePickerFromSubView)];
    
    [UIView commitAnimations];
}

-(void)removeDatePickerFromSubview:(UIDatePicker *)dateP {
    [self.datePicker removeFromSuperview];
    [self.datePicker release];
}

-(void)SelectSubject:(SelectSubjectTableViewController *)sender returnedSubject:(NSManagedObject *)subject {
    [sender dismissModalViewControllerAnimated:YES];
    
}
-(IBAction)resetSaveTime {
    if (self.timerRunning) { //Save
        
    }
    else { //Reset
     //   [self.repeatTimer invalidate];
        self.timerRunning = NO;
        self.timeLeft.text = @"00:00:00";
        
    }
}
-(IBAction)startTime {
    if(self.timerRunning) { //Pause was touched
        NSLog(@"In the first part of startTime method -> self.timerRunning = YES");
        self.startStopButton.titleLabel.text = @"Start";
        self.resetSaveButton.titleLabel.text = @"Reset";
        [self.repeatTimer invalidate];
        self.timerRunning = NO;
    }
    else { //Start was touched
        NSLog(@"In the second part of startTime method -> self.timerRunning = NO");

        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"lastDate"];
        self.repeatTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                        target:self
                                                      selector:@selector(updateLabel) 
                                                      userInfo:nil
                                                       repeats:YES];
        self.timerRunning = YES;
        self.startStopButton.titleLabel.text = @"Pause";
        self.resetSaveButton.titleLabel.text = @"Save";
    }
    
}
-(void)updateLabel {
    NSLog(@"Updating Label");
    NSTimeInterval timeSpent = [[NSDate date] timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"lastDate"]];
    int seconds=0, minutes=0, hours=0;
    NSLog(@"%f", timeSpent);
	
	
	hours = timeSpent/(60*60);
	minutes = timeSpent/60 - hours*60;
	seconds = timeSpent - 60*(60*hours + minutes);
    
 
   // self.timeLeft.text = @"%i : %i : %i", hours, minutes, seconds;
//    NSString *h;
//    NSString *m;
//    NSString *s;
//    hours < 10 ? h = [NSString stringWithFormat:@"0%i", hours] : h = [NSString stringWithFormat:@"%i", hours];
//    minutes < 10 ? m = @"0%i", minutes : m = @"%i", minutes;
//    seconds < 10 ? s = @"0%i", seconds : s = @"%i", seconds;
    NSString *timeText = [NSString stringWithFormat:@"%i : %i : %i", hours, minutes, seconds];
    self.timeLeft.text = timeText;    
}


#pragma mark - stuff Apple put in

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.timeSelectIsUp = NO;
        self.timerRunning = NO;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
