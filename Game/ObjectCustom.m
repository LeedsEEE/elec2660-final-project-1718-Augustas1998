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
    _SpecialPoints = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Special_Points."];
    //Setting the int 'specialPoints' value to that of the called upon value in NSUserDefault "Special_Points"
    //This value is then used to lock and unlock cutomisation themes
    
    if (_SpecialPoints >=200) {// If 'SpecialPoints' value is equale to or greater then 200
        _A_L_PacMan_theme.text = @"Available";// Set the text to the PacMan's theme availble/locked label
    }
    else{// If the if stamtment is not met
        _A_L_PacMan_theme.text = @"Locked";// Set the text to the PacMan's theme availble/locked label
    }
    if (_SpecialPoints >=500) {// If 'SpecialPoints' value is equale to or greater then 500
        _A_L_contra_theme.text = @"Available";// Set the text to the Contra's theme availble/locked label
    }
    else{// If the if stamtment is not met
        _A_L_contra_theme.text = @"Locked";// Set the text to the Contra's theme availble/locked label
    }
    if (_SpecialPoints >=2000) {// If 'SpecialPoints' value is equale to or greater then 2000
        _A_L_Donkey_theme.text = @"Available";// Set the text to the Donkey-Kong's theme availble/locked label
    }
    else{// If the if stamtment is not met
        _A_L_Donkey_theme.text = @"Locked";// Set the text to the Donkey-Kong's theme availble/locked label
    }
    if (_SpecialPoints >=5000) {// If 'SpecialPoints' value is equale to or greater then 5000
        _A_L_Mario_theme.text = @"Available";// Set the text to the Mario's theme availble/locked label
    }
    else{// If the if stamtment is not met
        _A_L_Mario_theme.text = @"Locked";// Set the text to the Mario's theme availble/locked label
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)Object_StickMan:(UIButton *)sender {// When the StickMan's theme image/button is pressed
    _ObjectSelect = @"StickMan_Theme";// Set the nsstring 'ObjectSelect' to that of the text
    [ self ObjectSelected]; //Calling the method 'ObjectSelected'
}

- (IBAction)Object_PacMan:(UIButton *)sender {// When the PacMan's theme image/button is pressed
    if(_SpecialPoints >= 200){// If 'SpecialPoints' value is equale to or greater then 200
        _ObjectSelect = @"PacMan_Theme";// Set the nsstring 'ObjectSelect' to that of the text
        [self ObjectSelected]; //Calling the method 'ObjectSelected'
    }
}

- (IBAction)Object_Contra:(UIButton *)sender {// When the Contra's theme image/button is pressed
    if(_SpecialPoints >= 500){// If 'SpecialPoints' value is equale to or greater then 500
        _ObjectSelect = @"Contra_Theme";// Set the nsstring 'ObjectSelect' to that of the text
        [self ObjectSelected]; //Calling the method 'ObjectSelected'
    }
}

- (IBAction)Object_Donkey:(UIButton *)sender {// When the Donkey-Kong's theme image/button is pressed
    if(_SpecialPoints >= 2000){// If 'SpecialPoints' value is equale to or greater then 2000
        _ObjectSelect = @"Donkey-Kong_Theme";// Set the nsstring 'ObjectSelect' to that of the text
        [self ObjectSelected]; //Calling the method 'ObjectSelected'
    }
}

- (IBAction)Object_Mario:(UIButton *)sender {// When the Mario's theme image/button is pressed
    if(_SpecialPoints >= 5000){// If 'SpecialPoints' value is equale to or greater then 5000
        _ObjectSelect = @"Mario_Theme";// Set the nsstring 'ObjectSelect' to that of the text
        [self ObjectSelected]; //Calling the method 'ObjectSelected'
    }
}

-(void)ObjectSelected{//Declearing the method
    [[NSUserDefaults standardUserDefaults]setObject:_ObjectSelect forKey:@"Object_Selected."];
    //Depending which button was pressed determins which text is set to 'ObjectSelect'. Then using NSUserDefault
    //the value of'ObjectSelected' is being saved to  NSUserDefault 'Object_Selected'
}
@end
