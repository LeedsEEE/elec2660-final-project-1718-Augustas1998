//
//  CharacterCustom.m
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "CharacterCustom.h"
#import "ViewController.h"

@interface CharacterCustom ()

@end

@implementation CharacterCustom

- (void)viewDidLoad {
    [super viewDidLoad];
    _SpecialPoints = 150;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Character_PanMan:(UIButton *)sender {
    if( _SpecialPoints >= 50){
        _CharSelect = @"PacMan";
    }
}

- (IBAction)Character_Contra:(UIButton *)sender {
    if( _SpecialPoints >= 100){
        _CharSelect = @"Contra";
    }
}

- (IBAction)Character_Donkey:(UIButton *)sender {
    if( _SpecialPoints >= 200){
        _CharSelect = @"Donkey-Kong";
    }
}

- (IBAction)Character_Mario:(UIButton *)sender {
    if( _SpecialPoints >= 500){
        _CharSelect = @"Mario";
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ViewController*secondcontroller = [segue destinationViewController];
    secondcontroller.CharSelect = _CharSelect;
}


@end
