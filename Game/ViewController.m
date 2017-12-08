//
//  ViewController.m
//  Game
//
//  Created by Augustas Jackevic on 13/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     This class mainly detects the type of device model the user is operating on. Unless the device model is
     Iphone: 6,6+,7, or 7+, a warning pop-up alet message will show up. Once the user clicks the only availble button,
     the application will close. I used the website:stackoverflow.com/questions/34692154/display-alert-message-from-viewdidload, to guide me in the way of implimenting the alert message pop-up in the viewDidLoad.
    */
    
    if([[UIScreen mainScreen] bounds].size.width == 667 || //This if statment checks the width size of the device model selected. These two are the ones of
       // I used the following website:stackoverflow.com/questions/14372906/to-detect-ios-device-type in guiding me on the detection of the device model
       [[UIScreen mainScreen] bounds].size.width == 736){ // Iphone 6/7 and Iphone 6+/7+
        nil; //if the condtion is met, pass
    }
    else{
        UIAlertController * DeviceWarning = [UIAlertController //Defining DeviceWarning to UIAlertController
                                     alertControllerWithTitle:@"Warning" //Naming the titel of pop-up
                                     message:@"Warning this application is only compatible with the following devices: Iphone 6, Iphone 6+, Iphone 7 and Iphone 7+" //Setting the meesage of the pop-up
                                     preferredStyle:UIAlertControllerStyleAlert]; //Selecting the way the message will be presented
        
        UIAlertAction* OkButton = [UIAlertAction //Adding an an action, which the user can interact with
                                    actionWithTitle:@"Ok" //Namking the action
                                    style:UIAlertActionStyleDefault //Selecting the style in which the action button will be presented
                                    handler:^(UIAlertAction * action) { //Creating the action handler
                                        exit(0); //when the OkButton has been pressed, exit the app
                                    }];
        [DeviceWarning addAction:OkButton]; //Setting the OkButton action, to the alert DeviceWarning
        dispatch_async(dispatch_get_main_queue(), ^ { // Required line, to use the UIAlertController in the ViewDidLoad
        [self presentViewController:DeviceWarning animated:YES completion:nil];//Present the DeviceWarning pop-up
        });
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ExitButton:(UIButton *)sender { //When the ExitButton is pressed
    exit(0); //Exit the application
}
@end

