//
//  AddClassViewController.m
//  iWillNotProcrastinate
//
//  Created by Josh Meier on 5/13/11.
//  Copyright 2011 BigMeierHouse. All rights reserved.
//

#import "AddClassViewController.h"


@implementation AddClassViewController
@synthesize teacherField;
@synthesize classField;
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [teacherField release];
    [classField release];
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
    self.classField.delegate = self;
    self.teacherField.delegate = self;
    self.classField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.teacherField.autocapitalizationType = UITextAutocapitalizationTypeWords;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.classField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField 
{
    [self.delegate AddClassViewController:self gotSubject:self.classField.text andTeacher:self.teacherField.text];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.classField = nil;
    self.teacherField = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
