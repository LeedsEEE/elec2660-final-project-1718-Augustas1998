//
//  ViewController.m
//  Game
//
//  Created by Augustas Jackevic on 13/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "ViewController.h"
#import "GamePlay.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ExitButton:(UIButton *)sender {
    exit(0);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    GamePlay*secondcontroller = [segue destinationViewController];
    secondcontroller.CharSelect = _CharSelect;
}

@end
