//
//  CharacterCustom.m
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "CharacterCustom.h"
#import "GamePlay.h"
#import "ViewController.h"

@interface CharacterCustom ()

@end

@implementation CharacterCustom

- (void)viewDidLoad {
    [super viewDidLoad];
      _SpecialPoints = [[NSUserDefaults standardUserDefaults] integerForKey:@"Special"];
    if (_SpecialPoints >=50) {
        _A_L_pacman.text = @"Available";
    }
    else{
         _A_L_pacman.text = @"Locked";
    }
    if (_SpecialPoints >=100) {
        _A_L_contra.text = @"Available";
    }
    else{
        _A_L_contra.text = @"Locked";
    }
    if (_SpecialPoints >=200) {
        _A_L_Donkey.text = @"Available";
    }
    else{
        _A_L_Donkey.text = @"Locked";
    }
    if (_SpecialPoints >=500) {
        _A_L_mario.text = @"Available";
    }
    else{
        _A_L_mario.text = @"Locked";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Character_StickMan:(UIButton *)sender {
    if( _SpecialPoints >= 0){
        _CharSelect = @"StickMan";
        [self CharacterSelected];
    }
}

- (IBAction)Character_PanMan:(UIButton *)sender {
    if( _SpecialPoints >= 50){
        _CharSelect = @"PacMan";
        [self CharacterSelected];
    }
}

- (IBAction)Character_Contra:(UIButton *)sender {
    if( _SpecialPoints >= 100){
        _CharSelect = @"Contra";
        [self CharacterSelected];
    }
}

- (IBAction)Character_Donkey:(UIButton *)sender {
    if( _SpecialPoints >= 200){
        _CharSelect = @"Donkey-Kong";
        [self CharacterSelected];
    }
}

- (IBAction)Character_Mario:(UIButton *)sender {
    if( _SpecialPoints >= 500){
        _CharSelect = @"Mario";
        [self CharacterSelected];
    }
}

-(void)CharacterSelected{
    [[NSUserDefaults standardUserDefaults]setObject:_CharSelect forKey:@"CharacterSelected"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



@end
