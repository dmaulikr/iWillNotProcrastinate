//
//  SubjectsListDetailViewController.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/10/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Subject.h"

@interface SubjectsListDetailViewController : UIViewController {
    Subject *subject;
    IBOutlet UISegmentedControl *segmentControl;
    NSManagedObjectContext *context;
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withSubject:(Subject *)theSubject;

@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) Subject *subject;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;
@property (nonatomic, retain) NSManagedObjectContext *context;

@end
