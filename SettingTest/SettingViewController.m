//
//  SettingViewControllerTableViewController.m
//  SettingTest
//
//  Created by supermacho on 12.10.16.
//  Copyright © 2016 supermacho. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewControllerTableViewController ()

@end

static NSString* kSettingsLogin         = @"login";
static NSString* kSettingsPassword      = @"password";
static NSString* kSettingsLevel         = @"level";
static NSString* kSettingsShadows       = @"shadows";
static NSString* kSettingsDetalization   = @"detalization";
static NSString* kSettingsLSound        = @"sound";
static NSString* kSettingsMusic         = @"music";



@implementation SettingViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) ns{
    NSString* s;
    
}


#pragma mark - Save and Load
- (void) saveSettings {
    NSUserDefaults* userdefauilts = [NSUserDefaults standardUserDefaults];
   
    
    [userdefauilts setObject:self.loginField.text forKey:kSettingsLogin];
    [userdefauilts setObject:self.passwordField.text forKey:kSettingsPassword];
    
    [userdefauilts setInteger:self.levelControl.selectedSegmentIndex forKey:kSettingsLevel];
    [userdefauilts setBool:self.shadowsSwitch.isOn forKey:kSettingsShadows];
    [userdefauilts setInteger:self.detalizationControl.selectedSegmentIndex forKey:kSettingsDetalization];
    [userdefauilts setDouble:self.soundSlider.value forKey:kSettingsLSound];
    [userdefauilts setDouble:self.musicSlider.value forKey:kSettingsMusic];
    
    
    [userdefauilts synchronize];
}



#pragma mark - Actions


- (IBAction)actionTextChanged:(id)sender {
}

- (IBAction)actionValueChanged:(id)sender {
}

@end
