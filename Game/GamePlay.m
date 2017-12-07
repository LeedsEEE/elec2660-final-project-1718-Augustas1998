

//
//  GamePlay.m
//  Game
//
//  Created by Augustas Jackevic on 15/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "GamePlay.h"

@interface GamePlay ()

@end

@implementation GamePlay

- (void)viewDidLoad {
    [super viewDidLoad];
    _ObjectImage.hidden = true;// Set 'ObjectImage' to hidden, hence when the view loads, the image will be hidden
    _CharacterImage.hidden = true;// Set 'CharacterImage' to hidden, hence when the view loads, the image will be hidden
    [self characterSelectedImages];// Calling the method 'CharacterSelectedImage'. This method sets the image of the character
    [self objectSelectedImages];// Calling the method 'objectSelectedImages'. This method sets the image of the object
    [self DeviceSelected];// Calling the method 'DeviceSelected'. This method sets the position and size of images depending on the device model
    _NotIntersected = true;// Setting the the bool veribal 'NotIntersected' to equal to true
    
    _SpecialPoints = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Special"];
     //Setting the 'SpecialPoints' value to that of the called upon value in NSUserDefault "Special".
    _Bvalue = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Bestvalue"];
     //Setting the'Bvalue' value to that of the called upon value in NSUserDefault "Bestvalue"
    _RoundsPlayed = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"AmountPlayed"];
     //Setting the 'RoundsPlayed' value to that of the called upon value in NSUserDefault "AmountPlayed"
    _BestScore.text = [NSString stringWithFormat:@"Best: %i",_Bvalue];
    //Setting the best score label to that of some text and the 'Bvalue' value
    _RoundsPlayed ++;
    //Updating the amount of rounds played by incrementing 'RoundsPlayed' by 1
    [[NSUserDefaults standardUserDefaults]setInteger:_RoundsPlayed forKey:@"AmountPlayed"];
    //Setting the value of 'RoundsPlayed' to NSUserDefault "AmountPlayed"
}

- (IBAction)DownButton:(UIButton *)sender {// When the down button is pressed
    if (_CharacterValue < 1){// If 'CharacterValue' value is belowe 1. This code makes sure the character is not moved unless it is equale to 0 or -1. Hence keeping the image inside the 3 fixed values the image could take place
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y + 90);
        //Set the 'CharacterImage' to that of the previous value but this time +90 pixels on the y-axis
        _CharacterValue ++;// Increment 'CharacterValue'
    }
}
- (IBAction)UpButton:(UIButton *)sender {// When the up botton is pressed
    if (_CharacterValue > -1){// If 'CharacterValue' value is above -1. This code makes sure the character is not moved unless it is equale to 0 or 1. Hence keeping the image inside the 3 fixed values the image could take place
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y - 90);
        //Set the 'CharacterImage' to that of the previous value but this time -90 pixels on the y-axis
        _CharacterValue --;// Decrement 'CharacterValue'
    }
}








- (IBAction)TouchToBegin:(UIButton *)sender{// When the touch to begin button is pressed
    _TouchToBegin.hidden = true;// Hide the touch to begin button
    _ObjectImage.hidden = false;// Reveal the hidden object image
    _CharacterImage.hidden = false;// Reveal the hidden character image
    _Object = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(ObjectLocation) userInfo:nil repeats:YES];
    //Setting up the paramiters of the NSTimer 'Object'. This code set the time internal in which the 'ObjectLocation' method is set. As can see, the time internal is set to 0.5mS, which is constantly repeated
    [self ObjectLocation];// Calling the 'ObjectLocation' Method
    
}
-(void)ObjectLocation{// Declearing the method 'ObjectLocation'
    if (_NotIntersected == true){// If the images 'NotIntersected' is equale to true
        if( _Svalue >= 0 && _Svalue < 10){// If the Svalue (Score value) if between 0 and 10 (not included)
            _Speed = 2;// Set speed to equale 2
        }
        else if( _Svalue >= 10 && _Svalue < 20){// If the Svalue (Score value) if between 10 and 20 (not included)
            _Speed = 3;// Set speed to equale 3
        }
        else if (_Svalue >= 20 && _Svalue < 30){// If the Svalue (Score value) if between 20 (included) and 30 (not included)
            _Speed = 4;// Set speed to equale 4
        }
        else if (_Svalue >= 30 && _Svalue < 40){// If the Svalue (Score value) if between 30 (included) and 40 (not included)
            _Speed = 5;// Set speed to equale 5
        }
        else if (_Svalue >= 40 && _Svalue < 50){// If the Svalue (Score value) if between 40 (included) and 50 (not included)
            _Speed = 6;// Set speed to equale 6
        }
        else if (_Svalue >= 50 && _Svalue < 60){// If the Svalue (Score value) if between 50 (included) and 60 (not included)
            _Speed = 7;// Set speed to equale 7
        }
        else if (_Svalue >= 60 && _Svalue < 70){// If the Svalue (Score value) if between 60 (included) and 70 (not included)
            _Speed = 8;// Set speed to equale 8
        }
        else if (_Svalue >= 70 && _Svalue < 80){// If the Svalue (Score value) if between 70 (included) and 80 (not included)
            _Speed = 9;// Set speed to equale 9
        }
        else if (_Svalue >= 80 && _Svalue < 90){// If the Svalue (Score value) if between 80 (included) and 90 (not included)
            _Speed = 10;// Set speed to equale 10
        }
        else if (_Svalue >= 90 && _Svalue < 100){// If the Svalue (Score value) if between 90 (included) and 100 (not included)
            _Speed = 11;// Set speed to equale 11
        }
        else if (_Svalue >= 100 && _Svalue < 110){// If the Svalue (Score value) if between 100 (included) and 110 (not included)
            _Speed = 12;// Set speed to equale 12
        }
        else{// If non of the if statment are met
            _Speed = 13;// Set speed to equale 13
        }
        _ObjectImage.center = CGPointMake(_ObjectImage.center.x - _Speed, _ObjectImage.center.y);
        //Move the center of 'ObjectImage' in the X-axis by amount set by speed. Since speed is determined
        //by the score value, as the score increases the speed too increases
        if(_ObjectImage.center.x <= -30){// If the center x-axis value is less then or equale to -30
            [self objectSelectedImages];// Calling the 'objectSelectedImages' method
            NSUInteger RandomValue = arc4random_uniform(3);// Setting the interger 'RandomValue' to the random genorated number created by arc4random, which would be eigther 1,2,3
            if (RandomValue == 1) {// If 'RandomValue' is equale to 1
                _RandObject = _ObjectBottom;// Set the 'RandObject' value to 'ObjectBottom' value. This is then used to set the Y-axis center of the 'ObjectImage'
            }
            else if( RandomValue == 2){// 'RandomValue' is equale to 2
                _RandObject = _ObjectMiddel;// Set the 'RandObject' value to 'ObjectBottom' value. This is then used to set the Y-axis center of the 'ObjectImage'
            }
            else{// if the if statment are not met
                _RandObject = _ObjectTop;// Set the 'RandObject' value to 'ObjectBottom' value. This is then used to set the Y-axis center of the 'ObjectImage'
            }
            _Svalue ++;// Increment the SValue (score value)
            _BestScore.text = [NSString stringWithFormat:@"Best: %i", _Bvalue];//Displaying the 'Bvalue' value and text in the best score label
            if(_Svalue >= _Bvalue){// If the SValue (score value) is equal to or greater then BValue (best value)
                [[NSUserDefaults standardUserDefaults]setInteger: _Bvalue forKey:@"Bestvalue"];// Setting the value of 'BValue' to NSUserDefault "Bestvalue"
                _Bvalue = _Svalue + 1;// Setting the BValue(best score) to equale to Svalue(score value) +1

            }
            _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];//Displaying the 'Svalue' value and text in the score value label

           [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"10"];
            _ObjectImage.center = CGPointMake(_ObjectX,_RandObject);
        }
        if(CGRectIntersectsRect(_ObjectImage.frame, _CharacterImage.frame)){
            
            if(_ObjectGenerated ==true){
                [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"10"];
                _NotIntersected = false;
                float FinalScore = _Svalue;
                [[NSUserDefaults standardUserDefaults] setFloat:FinalScore forKey:@"FinalScore"];
                [self gameOver];
                
            }
            
            else if (_ObjectGenerated==false){
                _SpecialPoints = _SpecialPoints + 1;
                [[NSUserDefaults standardUserDefaults]setInteger:_SpecialPoints forKey:@"Special"];
                [self objectSelectedImages];
                NSUInteger RandomValue = arc4random_uniform(3);
                int RandObjects;
                
                if (RandomValue == 1) {
                    RandObjects = _ObjectBottom;
                }
                
                else if( RandomValue == 2){
                    RandObjects = _ObjectMiddel;
                }
                
                else{
                    RandObjects = _ObjectTop;
                }
                
                _ObjectImage.center = CGPointMake(_ObjectX,RandObjects);
                _Svalue = _Svalue + 1;
                _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];
                _BestScore.text = [NSString stringWithFormat:@"Best: %i", _Bvalue];
                if(_Svalue >= _Bvalue){
                    [[NSUserDefaults standardUserDefaults]setInteger:_Bvalue forKey:@"Bestvalue"];
                    _Bvalue = _Svalue + 1;
                }
            }
        }
    }
}


-(void)gameOver{
    GamePlay *NVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GameOver"];
    [self presentViewController:NVC animated:YES completion:nil];
}

-(void)DeviceSelected{
    if([[UIScreen mainScreen] bounds].size.width == 667 || [[UIScreen mainScreen] bounds].size.height == 667){
        //IPHONE6/7
        _CharacterImage.center = CGPointMake(20, 180);
        _ObjectImage.center = CGPointMake(553, 180);
        _TunnelTop.center = CGPointMake(620, 90);
        _TunnelMiddel.center = CGPointMake(620, 180);
        _TunnelBottom.center = CGPointMake(620, 270);
        
        CGRect frame = _Background.frame;
        frame.size.width = 667;
        frame.size.height =375;
        _Background.frame = frame;
        
        _ObjectTop = 90;
        _ObjectMiddel = 180;
        _ObjectBottom = 270;
        _ObjectX = 533;
    }
    else{
        //IPHONE 6+/7+
        _CharacterImage.center = CGPointMake(20, 210);
        _ObjectImage.center = CGPointMake(620, 210);
        _TunnelTop.center = CGPointMake(695, 120);
        _TunnelMiddel.center = CGPointMake(695, 210);
        _TunnelBottom.center = CGPointMake(695, 300);
        _ObjectTop = 120;
        _ObjectMiddel = 210;
        _ObjectBottom = 300;
        _ObjectX = 600;
    }
}


-(void)characterSelectedImages;{
    
    NSString *CharSelect = [[NSUserDefaults standardUserDefaults] stringForKey:@"CharacterSelected"];
    if ([CharSelect  isEqual: @"StickMan"]) {
        [_CharacterImage setImage: [UIImage imageNamed:@"Whie_StickMan.png"]];
    }
    else if ([CharSelect  isEqual: @"PacMan"]) {
        [_CharacterImage setImage: [UIImage imageNamed:@"PacMan_Icon.png"]];
    }
    else if ([CharSelect isEqualToString:@"Contra"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"Contra_Icon.png"]];
    }
    else if ([CharSelect isEqualToString:@"Donkey-Kong"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"DonkeyKong_theme..png"]];
    }
    else if ([CharSelect isEqualToString:@"Mario"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"Mario_Icon.png"]];
    }
    else{
        [_CharacterImage setImage: [UIImage imageNamed:@"Whie_StickMan.png"]];
    }
}

-(void)objectSelectedImages{
    NSString *objectSelect = [[NSUserDefaults standardUserDefaults] stringForKey:@"ObjectSelected"];
    NSUInteger R = arc4random_uniform(10);

    
    if ([objectSelect isEqualToString:@"StickMan_Theme"]){
        [_Background setImage:[UIImage imageNamed:@"StickManBackground.jpg"]];
        if (R > 1){
            _ObjectGenerated = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"BlackBall.png"]];
        }
        else{
            _ObjectGenerated = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"WhiteBall.gif"]];
        }
    }
    else if ([objectSelect isEqualToString:@"PacMan_Theme"]){
        [_Background setImage:[UIImage imageNamed:@"PacManBackground.png"]];
        if (R > 1){
            _ObjectGenerated = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Goast_Icon.png"]];
        }
        else{
            _ObjectGenerated = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Strawberry.png"]];
        }
    }

    else if ([objectSelect isEqualToString:@"Contra_Theme"]){
        [_Background setImage:[UIImage imageNamed:@"ContraBackground.png"]];
        if (R > 1){
            _ObjectGenerated = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"ContraBoss_Icon.png"]];
        }
        else{
            _ObjectGenerated = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Contra_s_Icon.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"Donkey-Kong_Theme"]){
        [_Background setImage:[UIImage imageNamed:@"DonkeyBackground.jpg"]];
        if (R > 1){
            _ObjectGenerated = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Barrel_Icon..png"]];
        }
        else{
            _ObjectGenerated = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Banana_Icon.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"Mario_Theme"]){
        [_Background setImage:[UIImage imageNamed:@"MarioBackground.png"]];
        if (R > 1){
            _ObjectGenerated = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Goomba1.png"]];
        }
        else{
            _ObjectGenerated = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"MushRoom.gif"]];
        }
    }
    else{
        if (R > 1){
            _ObjectGenerated = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"BlackBall.png"]];
        }
        else{
            _ObjectGenerated = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"WhiteBall.gif"]];
        }
    }

}
















@end
