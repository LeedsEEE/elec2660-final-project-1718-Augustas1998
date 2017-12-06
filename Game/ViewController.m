//
//  ViewController.m
//  Game
//
//  Created by Augustas Jackevic on 13/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "ViewController.h"
#import "GamePlay.h"
//#import "Statistics.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if([[UIScreen mainScreen] bounds].size.width == 667 || [[UIScreen mainScreen] bounds].size.height == 667 || [[UIScreen mainScreen] bounds].size.width == 736 || [[UIScreen mainScreen] bounds].size.height == 736){
        nil;
    }
    else{
        UIAlertController * DeviceWarning = [UIAlertController
                                     alertControllerWithTitle:@"Warning"
                                     message:@"Warning the application is only compatible with the following devices: Iphone 6, Iphone 6+, Iphone 7 and Iphone 7+"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* OkButton = [UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        exit(0);
                                    }];
        [DeviceWarning addAction:OkButton];
        dispatch_async(dispatch_get_main_queue(), ^ {
        [self presentViewController:DeviceWarning animated:YES completion:nil];
        });
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ExitButton:(UIButton *)sender {

}
    //exit(0);
//}

@end

