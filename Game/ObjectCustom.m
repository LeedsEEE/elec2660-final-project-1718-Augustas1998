//
//  ObjectCustom.m
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "ObjectCustom.h"

@interface ObjectCustom ()

@end

@implementation ObjectCustom

- (void)viewDidLoad {
    [super viewDidLoad];
    _SpecialPoints = 1000;
    //_SpecialPoints = [[NSUserDefaults standardUserDefaults] integerForKey:@"Special"];
    if (_SpecialPoints >=50) {
        _A_L_PacMan_theme.text = @"Available";
    }
    else{
        _A_L_PacMan_theme.text = @"Locked";
    }
    if (_SpecialPoints >=100) {
        _A_L_contra_theme.text = @"Available";
    }
    else{
        _A_L_contra_theme.text = @"Locked";
    }
    if (_SpecialPoints >=200) {
        _A_L_Donkey_theme.text = @"Available";
    }
    else{
        _A_L_Donkey_theme.text = @"Locked";
    }
    if (_SpecialPoints >=500) {
        _A_L_Mario_theme.text = @"Available";
    }
    else{
        _A_L_Mario_theme.text = @"Locked";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Object_StickMan:(UIButton *)sender {
    if(_SpecialPoints >= 0){
        _ObjectSelect = @"StickMan_Theme";
        [self ObjectSelected];
    }
}

- (IBAction)Object_PacMan:(UIButton *)sender {
    if(_SpecialPoints >= 50){
        _ObjectSelect = @"PacMan_Theme";
        [self ObjectSelected];
    }
}

- (IBAction)Object_Contra:(UIButton *)sender {
    if(_SpecialPoints >= 100){
        _ObjectSelect = @"Contra_Theme";
        [self ObjectSelected];
    }
}

- (IBAction)Object_Donkey:(UIButton *)sender {
    if(_SpecialPoints >= 200){
        _ObjectSelect = @"Donkey-Kong_Theme";
        [self ObjectSelected];
    }
}

- (IBAction)Object_Mario:(UIButton *)sender {
    if(_SpecialPoints >= 500){
        _ObjectSelect = @"Mario_Theme";
        [self ObjectSelected];
    }
}

-(void)ObjectSelected{
    [[NSUserDefaults standardUserDefaults]setObject:_ObjectSelect forKey:@"ObjectSelected"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
