//
//  AddClassViewController.h
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/13/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddClassViewControllerDelegate;

@interface AddClassViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *classField;
    IBOutlet UITextField *teacherField;
    id <AddClassViewControllerDelegate> delegate;
}

@property (nonatomic, retain) IBOutlet UITextField *classField;
@property (nonatomic, retain) IBOutlet UITextField *teacherField;

@property (assign) id <AddClassViewControllerDelegate> delegate;

@end

@protocol AddClassViewControllerDelegate
-(void)AddClassViewController:(AddClassViewController *)sender gotSubject:(NSString *)subject andTeacher:(NSString *)teacher;
@end
