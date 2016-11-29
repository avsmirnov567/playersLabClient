//
//  PLMainViewController.m
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import "PLMainViewController.h"
#import "PLRouter.h"

@interface PLMainViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *showAllBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameInputField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *countryInput;
@property (weak, nonatomic) IBOutlet UITextField *sportInput;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation PLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameInputField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAllClicked:(id)sender {
    [[PLRouter sharedInstance] showListWithName:nil];
}

- (IBAction)searchClicked:(id)sender {
    [self.nameInputField resignFirstResponder];
    if (self.nameInputField.text.length > 0){
        [[PLRouter sharedInstance] showListWithName:self.nameInputField.text];
    }
}

- (IBAction)addClicked:(id)sender {
    if (self.nameInput.text.length > 0 && self.countryInput.text.length > 0 && self.countryInput.text.length > 0){
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
