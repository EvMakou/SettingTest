//
//  STableViewController.m
//  SettingTest
//
//  Created by supermacho on 12.10.16.
//  Copyright © 2016 supermacho. All rights reserved.
//

#import "STableViewController.h"

@interface STableViewController ()

@end
static NSString* kSettingsLogin         = @"login";
static NSString* kSettingsPassword      = @"password";
static NSString* kSettingsLevel         = @"level";
static NSString* kSettingsShadows       = @"shadows";
static NSString* kSettingsDetalization   = @"detalization";
static NSString* kSettingsSound        = @"sound";
static NSString* kSettingsMusic         = @"music";
@implementation STableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self loadSettings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Save and Load
- (void) saveSettings {
    NSUserDefaults* userdefauilts = [NSUserDefaults standardUserDefaults];
    
    
    [userdefauilts setObject:self.loginField.text forKey:kSettingsLogin];
    [userdefauilts setObject:self.passwordField.text forKey:kSettingsPassword];
    
    [userdefauilts setInteger:self.levelControl.selectedSegmentIndex forKey:kSettingsLevel];
    [userdefauilts setBool:self.shadowsSwitch.isOn forKey:kSettingsShadows];
    [userdefauilts setInteger:self.detalizationControl.selectedSegmentIndex forKey:kSettingsDetalization];
    [userdefauilts setDouble:self.soundSlider.value forKey:kSettingsSound];
    [userdefauilts setDouble:self.musicSlider.value forKey:kSettingsMusic];
    
    
    [userdefauilts synchronize];
}


- (void) loadSettings {
    NSUserDefaults* userdefauilts = [NSUserDefaults standardUserDefaults];
    self.loginField.text = [userdefauilts objectForKey:kSettingsLogin];
    self.passwordField.text = [userdefauilts objectForKey:kSettingsPassword];
    
    self.levelControl.selectedSegmentIndex = [userdefauilts integerForKey:kSettingsLevel];
    self.shadowsSwitch.on = [userdefauilts boolForKey:kSettingsShadows];
    self.detalizationControl.selectedSegmentIndex = [userdefauilts integerForKey:kSettingsDetalization];
    
    self.soundSlider.value = [userdefauilts doubleForKey:kSettingsSound];
    self.musicSlider.value = [userdefauilts doubleForKey:kSettingsMusic];
    
    
    
}


#pragma mark - Actions


- (IBAction)actionTextChanged:(id)sender {
    [self saveSettings];
}

- (IBAction)actionValueChanged:(id)sender {
    [self saveSettings];
}

#pragma mark - UITextFieldDelegate 

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.loginField]) {
        [self.passwordField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return  NO;
}



@end
