//
//  CharacterCustom.m
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "CharacterCustom.h"

@interface CharacterCustom ()

@end

@implementation CharacterCustom

- (void)viewDidLoad {
    _SpecialPoints = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Special_Points"];
    //Setting the int 'SpecialPoints' value to that of the called upon value in NSUserDefault "Special_Points"
    //This value is then used to lock and unlock cutomisation themes
    if (_SpecialPoints >=200) {// If 'SpecialPoints' value is equale to or greater then 200
        _A_L_pacman.text = @"Available";// Set the text to the PacMan's availble/locked label
    }
    else{// If the if stamtment is not met
         _A_L_pacman.text = @"Locked";// Set the text to the PacMan's availble/locked label
    }
    if (_SpecialPoints >=500) {// If 'SpecialPoints' value is equale to or greater then 500
        _A_L_contra.text = @"Available";// Set the text to the Contra's availble/locked label
    }
    else{
        _A_L_contra.text = @"Locked";// Set the text to the Contra's availble/locked label
    }
    if (_SpecialPoints >=2000) {// If 'SpecialPoints' value is equale to or greater then 2000
        _A_L_Donkey.text = @"Available";// Set the text to the Donkey-Kong's availble/locked label
    }
    else{// If the if stamtment is not met
        _A_L_Donkey.text = @"Locked";// Set the text to the Donkey-Kong's availble/locked label
    }
    if (_SpecialPoints >=5000) {// If 'SpecialPoints' value is equale to or greater then 5000
        _A_L_mario.text = @"Available";// Set the text to the Mario's availble/locked label
    }
    else{// If the if stamtment is not met
        _A_L_mario.text = @"Locked";// Set the text to the  Mario's availble/locked label
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Character_StickMan:(UIButton *)sender {// When the StickMan's image/button is pressed
    _CharSelect = @"StickMan";// Set the nsstring 'CharSelect' to that of the text
    [self CharacterSelected];// Calling the method 'CharacterSelected'
}

- (IBAction)Character_PanMan:(UIButton *)sender {// When the PacMan's image/button is pressed
    if( _SpecialPoints >= 200){// If 'SpecialPoints' value is equale to or greater then 200
        _CharSelect = @"PacMan";// Set the nsstring 'CharSelect' to that of the text
        [self CharacterSelected];// Calling the method 'characterSelected'
    }
}

- (IBAction)Character_Contra:(UIButton *)sender {// When the Contra's image/button is pressed
    if( _SpecialPoints >= 500){// If 'SpecialPoints' value is equale to or greater then 500
        _CharSelect = @"Contra";// Set the nsstring 'CharSelect' to that of the text
        [self CharacterSelected];// Calling the method 'CharacterSelected'
    }
}

- (IBAction)Character_Donkey:(UIButton *)sender {// When the Donkey-Kong's image/button is pressed
    if( _SpecialPoints >= 2000){// If 'SpecialPoints' value is equale to or greater then 2000
        _CharSelect = @"Donkey-Kong";// Set the nsstring 'CharSelect' to that of the text
        [self CharacterSelected];// Calling the method 'CharacterSelected'
    }
}

- (IBAction)Character_Mario:(UIButton *)sender {// When the Mario's image/button is pressed
    if( _SpecialPoints >= 5000){// If 'SpecialPoints' value is equale to or greater then 5000
        _CharSelect = @"Mario";// Set the nsstring 'CharSelect' to that of the text
        [self CharacterSelected];// Calling the method 'CharacterSelected'
    }
}

-(void)CharacterSelected{//Declearing the method 'CharacterSelected'
    [[NSUserDefaults standardUserDefaults]setObject:_CharSelect forKey:@"Character_Selected"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //Depending which button was pressed determins which text is set to 'CharSelect'. Then using NSUserDefault
    //the value of'CharSelect' is being saved to  NSUserDefault 'Character_Selected'
}



@end
