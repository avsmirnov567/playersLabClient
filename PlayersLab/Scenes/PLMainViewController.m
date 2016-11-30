//
//  PLMainViewController.m
//  PlayersLab
//
//  Created by kirill on 28.11.16.
//  Copyright © 2016 maugrysmirnov. All rights reserved.
//

#import "PLMainViewController.h"
#import "PLRouter.h"
#import "PLDataManager.h"

@interface PLMainViewController ()<UITextFieldDelegate, PLDataManagerAlertDelegate>

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
    [PLDataManager sharedInstance].alertDelegate = self;
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
    if (self.nameInput.text.length > 0 && self.sportInput.text.length > 0 && self.countryInput.text.length > 0){
        [PLDataManager addPlayerWithName:self.nameInput.text withSport:self.sportInput.text andCountry:self.countryInput.text];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)displayAlertError:(NSString *)p_errorDescription{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Ошибка!"
                                  message:p_errorDescription
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [self dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)displayAlertSuccess:(NSString *)p_responseString{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Запрос выполнен!"
                                  message:[NSString stringWithFormat:@"Ответ: %@", p_responseString]
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [self dismissViewControllerAnimated:YES completion:nil];
                             self.nameInput.text = @"";
                             self.sportInput.text = @"";
                             self.countryInput.text = @"";
                         }];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
