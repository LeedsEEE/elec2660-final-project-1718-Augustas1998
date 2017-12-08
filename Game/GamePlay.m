

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
    _SpecialPoints = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Special_Points."];
     //Setting the 'SpecialPoints' value to that of the called upon value in NSUserDefault "Special_Points".
    _Bvalue = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Best_value."];
     //Setting the'Bvalue' value to that of the called upon value in NSUserDefault "Best_value"
    _RoundsPlayed = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Amount_Played."];
     //Setting the 'RoundsPlayed' value to that of the called upon value in NSUserDefault "Amount_Played"
    _BestScore.text = [NSString stringWithFormat:@"Best: %i",_Bvalue];
    //Setting the best score label to that of some text and the 'Bvalue' value
    _RoundsPlayed ++;
    //Updating the amount of rounds played by incrementing 'RoundsPlayed' by 1
    [[NSUserDefaults standardUserDefaults]setInteger:_RoundsPlayed forKey:@"Amount_Played."];
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
    [self BackgroundMusic];// Calling the 'BackgroundMusic' method
    
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
                [[NSUserDefaults standardUserDefaults]setInteger: _Bvalue forKey:@"Best_value."];// Setting the value of 'BValue' to NSUserDefault "Best_value"
                _Bvalue = _Svalue + 1;// Setting the BValue(best score) to equale to Svalue(score value) +1

            }
            _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];//Displaying the 'Svalue' value and text in the score value label

           [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"CurrentScore."];// Setting the 'Svalue' value to NSUserDefault 'CurrentScore'
            _ObjectImage.center = CGPointMake(_ObjectX,_RandObject);//  Reposistioning the object image
        }
        if(CGRectIntersectsRect(_ObjectImage.frame, _CharacterImage.frame)){// If the character and object image intersect
            
            if(_ObjectGenerated ==true){// If the veribal 'ObjectGenorated' is equale to true
                [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"CurrentScore."];// Setting 'Svalue' value to NsUserDefault 'CurrentScore'
                _NotIntersected = false;// Setting veribal 'NotIntersected' to false, thus exitting the main if statment
                [[NSUserDefaults standardUserDefaults] setFloat:_Svalue forKey:@"Final_Score."];// Setting 'Svalue' value to that of NsUserDefault 'Final_Score
                [self.audioPlayer stop];// Stopes the current selected backgroung music
                [self gameOver];// Calling the 'gameOver' method
                
            }
            
            else if (_ObjectGenerated==false){ // else if 'ObjectGenorated' is equal to false
                _SpecialPoints ++; //Increment 'SpecialPoints' by 1
                [[NSUserDefaults standardUserDefaults]setInteger:_SpecialPoints forKey:@"Special_Points."];// Setting 'SpecialPoints' value to NSUserDefault  'Special_Points'
                [self objectSelectedImages];// Calling the 'objectSelectedImages' method
                NSUInteger RandomValue = arc4random_uniform(3);// Setting the interger 'RandomValue' to the random genorated number created by arc4random, which would be eigther 1,2,3
                int RandObjects;// Creating a integer verinal called 'RandObjects'
                
                if (RandomValue == 1) {// If 'RandomValue'' is equale to 1
                    RandObjects = _ObjectBottom;// Setting 'RandObjects' to equale to that of 'ObjectBottom'.
                }
                
                else if( RandomValue == 2){// Else if 'randomValue' is equal to 2
                    RandObjects = _ObjectMiddel;// Setting 'RandObjects' to equale to that of 'ObjectMiddel'.
                }
                
                else{// If the if statments are not met
                    RandObjects = _ObjectTop;// Setting 'RandObjects' to equale to that of 'ObjectTopl'.
                }
                
                _ObjectImage.center = CGPointMake(_ObjectX,RandObjects);// Reposition the object to one of the three possible levels
                _Svalue ++;// Incrementing the value of 'Svalue' by 1
                _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];//Displaying the 'Svalue' value and text in the score value label
                _BestScore.text = [NSString stringWithFormat:@"Best: %i", _Bvalue];// Setting the value of 'BValue' to NSUserDefault "Bestvalue"
                if(_Svalue >= _Bvalue){// if 'Svalue' is equale to or greater then 'Bvalue'
                    [[NSUserDefaults standardUserDefaults]setInteger:_Bvalue forKey:@"Best_value."];// Setting 'Bvalue' value to NsUserDefault 'Best_value'
                    _Bvalue = _Svalue + 1;// Setting the 'Bvalue' to equale to that of 'Svalue' + 1
                }
            }
        }
    }
}


-(void)gameOver{// Declearing the method 'gameOver'
    GamePlay *GameOverScreen = [self.storyboard instantiateViewControllerWithIdentifier:@"GameOver"];//Calling refrence to 'GamePlay' ViewController
    [self presentViewController:GameOverScreen animated:YES completion:nil];// Calling the refrence and thus changing views to 'GamePlay' ViewController
    //I used the following webist:stackoverflow.com/questions/31630213/change-view-controller-programmatically to guide me in changing ViewControllers
}

-(void)DeviceSelected{// Declearing the methoed 'Device Selected'
    if([[UIScreen mainScreen] bounds].size.width == 667){// If the width of the device is 667 pixels
        //IPHONE6/7
        _CharacterImage.center = CGPointMake(20, 180);// Set the 'CharacterImage' to that of the set point
        _ObjectImage.center = CGPointMake(553, 180);// Set the 'ObjectImage' to that of the set point
        _TunnelTop.center = CGPointMake(620, 90);// Set the 'TunnelTop' to that of the set point
        _TunnelMiddel.center = CGPointMake(620, 180);// Set the 'TunnelMiddel' to that of the set point
        _TunnelBottom.center = CGPointMake(620, 270);// Set the 'TunnelBottom' to that of the set point
        
        CGRect frame = _Background.frame;// Setting the veribal 'frame', to the postition and size of 'Background'
        frame.size.width = 667;// Setting the width of 'frame' to 667
        frame.size.height =375;// Setting the hight of 'frame' to height'
        _Background.frame = frame;// Setting the 'Background' to equal to the size and postion of 'frame'
        
        _ObjectTop = 90;// Setting the veribal 'ObjectTop' to equal to that of the set interger
        _ObjectMiddel = 180;// Setting the veribal 'ObjectMiddel' to equal to that of the set interger
        _ObjectBottom = 270;// Setting the veribal 'ObjectBottom' to equal to that of the set interger
        _ObjectX = 533;// Setting the veribal 'ObjectX' to equal to that of the set interger
    }
    else{// If the if statment is not met
        //IPHONE 6+/7+
        _CharacterImage.center = CGPointMake(20, 210); // Set the 'CharacterImage' to that of the set point
        _ObjectImage.center = CGPointMake(620, 210);// Set the 'ObjectImage' to that of the set point
        _TunnelTop.center = CGPointMake(695, 120);// Set the 'Tunneltop' to that of the set point
        _TunnelMiddel.center = CGPointMake(695, 210);// Set the 'TunnelMiddel' to that of the set point
        _TunnelBottom.center = CGPointMake(695, 300);// Set the 'TunnelBottom' to that of the set point
        _ObjectTop = 120;// Setting the veribal 'ObjectTop' to equal to that of the set interger
        _ObjectMiddel = 210;// Setting the veribal 'ObjectMiddel' to equal to that of the set interger
        _ObjectBottom = 300;// Setting the veribal 'ObjectBottom' to equal to that of the set interger
        _ObjectX = 600;// Setting the veribal 'ObjectX' to equal to that of the set interger
    }
}


-(void)characterSelectedImages;{// Declearing the method called 'characterSelectedImages'
    
    NSString *CharSelect = [[NSUserDefaults standardUserDefaults] stringForKey:@"Character_Selected."];
    //Setting the 'CharSeelct' value to that of the called upon value in NSUserDefault "CharacterSeelcted".
    if ([CharSelect  isEqual: @"StickMan"]) {// If 'CharSelect' is equal to the set text
        [_CharacterImage setImage: [UIImage imageNamed:@"Whie_StickMan.png"]];
        //Set the 'CharaterImage' to that of a photo file of stickMan
    }
    else if ([CharSelect  isEqual: @"PacMan"]) {// else if 'CharSelect' is equal to the set text
        [_CharacterImage setImage: [UIImage imageNamed:@"PacMan_Icon.png"]];
        //Set the 'CharaterImage' to that of a photo file of PacMan
    }
    else if ([CharSelect isEqualToString:@"Contra"]){// else if 'CharSelect' is equal to the set text
        [_CharacterImage setImage: [UIImage imageNamed:@"Contra_Icon.png"]];
        //Set the 'CharaterImage' to that of a photo file of Contra
    }
    else if ([CharSelect isEqualToString:@"Donkey-Kong"]){// else if 'CharSelect' is equal to the set text
        [_CharacterImage setImage: [UIImage imageNamed:@"DonkeyKong_theme..png"]];
        //Set the 'CharaterImage' to that of a photo file of Donkey-Kong
    }
    else if ([CharSelect isEqualToString:@"Mario"]){// else if 'CharSelect' is equal to the set text
        [_CharacterImage setImage: [UIImage imageNamed:@"Mario_Icon.png"]];
        //Set the 'CharaterImage' to that of a photo file of Mario
    }
    else{// If the if statments are not met
        [_CharacterImage setImage: [UIImage imageNamed:@"Whie_StickMan.png"]];
        //Set the 'CharaterImage' to that of a photo file of StickMan
        
        //I used the website:stackoverflow.com/questions/2172497/programmatically-change-the-uiimageview-displaying-image1-to-image2 to guide me on how to set an a UIImage to that of the specifiled photot file
    }
}

-(void)objectSelectedImages{// Declearing the method called 'objectSelectedImages'
    NSString *objectSelect = [[NSUserDefaults standardUserDefaults] stringForKey:@"Object_Selected."];
    //Setting the 'objectSelect' value to that of the called upon value in NSUserDefault "Object_Seelcted".
    NSUInteger R = arc4random_uniform(10);// Setting the interger 'R' to the random genorated number created by arc4random, which would be genorate numbers from 1 to 10

    
    if ([objectSelect isEqualToString:@"StickMan_Theme"]){// If 'objectSelect' is equal to the set text
        [_Background setImage:[UIImage imageNamed:@"StickManBackground.jpg"]];
        //Set the 'Background' image to that of a photo file of Stickman background
        if (R > 1){// If the the random integer assigned to R is greater then 1
            _ObjectGenerated = true;// Set 'objectGenerated' to equale to true
            [_ObjectImage setImage:[UIImage imageNamed:@"BlackBall.png"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
        else{// if the if statment is not met
            _ObjectGenerated = false;// Set 'objectGenerated' to equale to false
            [_ObjectImage setImage:[UIImage imageNamed:@"WhiteBall.gif"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
    }
    else if ([objectSelect isEqualToString:@"PacMan_Theme"]){// If 'objectSelect' is equal to the set text
        [_Background setImage:[UIImage imageNamed:@"PacManBackground.png"]];
        if (R > 1){// If the the random integer assigned to R is greater then 1
            _ObjectGenerated = true;// Set 'objectGenerated' to equale to true
            [_ObjectImage setImage:[UIImage imageNamed:@"Goast_Icon.png"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
        else{// if the if statment is not met
            _ObjectGenerated = false;// Set 'objectGenerated' to equale to false
            [_ObjectImage setImage:[UIImage imageNamed:@"Strawberry.png"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
    }

    else if ([objectSelect isEqualToString:@"Contra_Theme"]){// If 'objectSelect' is equal to the set text
        [_Background setImage:[UIImage imageNamed:@"ContraBackground.png"]];
        if (R > 1){// If the the random integer assigned to R is greater then 1
            _ObjectGenerated = true;// Set 'objectGenerated' to equale to true
            [_ObjectImage setImage:[UIImage imageNamed:@"ContraBoss_Icon.png"]];
        }
        else{// if the if statment is not met
            _ObjectGenerated = false;// Set 'objectGenerated' to equale to false
            [_ObjectImage setImage:[UIImage imageNamed:@"Contra_s_Icon.png"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
    }
    else if ([objectSelect isEqualToString:@"Donkey-Kong_Theme"]){// If 'objectSelect' is equal to the set text
        [_Background setImage:[UIImage imageNamed:@"DonkeyBackground.jpg"]];
        if (R > 1){// If the the random integer assigned to R is greater then 1
            _ObjectGenerated = true;// Set 'objectGenerated' to equale to true
            [_ObjectImage setImage:[UIImage imageNamed:@"Barrel_Icon..png"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
        else{// if the if statment is not met
            _ObjectGenerated = false;// Set 'objectGenerated' to equale to false
            [_ObjectImage setImage:[UIImage imageNamed:@"Banana_Icon.png"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
    }
    else if ([objectSelect isEqualToString:@"Mario_Theme"]){// If 'objectSelect' is equal to the set text
        [_Background setImage:[UIImage imageNamed:@"MarioBackground.png"]];
        if (R > 1){// If the the random integer assigned to R is greater then 1
            _ObjectGenerated = true;// Set 'objectGenerated' to equale to true
            [_ObjectImage setImage:[UIImage imageNamed:@"Goomba1.png"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
        else{// if the if statment is not met
            _ObjectGenerated = false;// Set 'objectGenerated' to equale to false
            [_ObjectImage setImage:[UIImage imageNamed:@"MushRoom.gif"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
    }
    else{// If the is statments are not met
        if (R > 1){// If the the random integer assigned to R is greater then 1
            _ObjectGenerated = true;// Set 'objectGenerated' to equale to true
            [_ObjectImage setImage:[UIImage imageNamed:@"BlackBall.png"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
        else{// if the if statment is not met
            _ObjectGenerated = false;// Set 'objectGenerated' to equale to false
            [_ObjectImage setImage:[UIImage imageNamed:@"WhiteBall.gif"]];
            //Set the 'ObjectImage' to that of the named photo file
        }
    }

}

-(void)BackgroundMusic{// Declearing the method called 'BackgroundMusic'
    NSString *Music = [[NSUserDefaults standardUserDefaults] stringForKey:@"Object_Selected."];
    //Setting the 'Music' value to that of the called upon value in NSUserDefault "Object_Seelcted".
    NSString *MusicTheme;// Creating an nsstring called 'MusicTheme'
    if( [Music isEqualToString:@"StickMan_Theme"]){// If 'MusicTheme' is equale to that of the set text
        MusicTheme = @"StickMan";// Set 'MusicTheme' to the set text
    }
    else if( [Music isEqualToString:@"PacMan_Theme"]){// If 'MusicTheme' is equale to that of the set text
        MusicTheme = @"PacMan";// Set 'MusicTheme' to the set text
    }
    else if( [Music isEqualToString:@"Contra_Theme"]){// If 'MusicTheme' is equale to that of the set text
        MusicTheme = @"Contra";// Set 'MusicTheme' to the set text
    }
    else if( [Music isEqualToString:@"Donkey-Kong_Theme"]){// If 'MusicTheme' is equale to that of the set text
        MusicTheme = @"Donkey-Kong";// Set 'MusicTheme' to the set text
    }
    else if( [Music isEqualToString:@"Mario_Theme"]){// If 'MusicTheme' is equale to that of the set text
        MusicTheme = @"Mario";// Set 'MusicTheme' to the set text
    }
    else{// if the if statment is not met
        MusicTheme = @"StickMan";// Set 'MusicTheme' to the set text
    }
    NSString *FilePath = [[NSBundle mainBundle] pathForResource:MusicTheme ofType:@"mp3"];// Set the path of where the file is stored to 'FilePath'
    NSURL *fileurl = [[NSURL alloc] initFileURLWithPath:FilePath];// Points the url to where the file is saved (FilePath)
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileurl error:nil];// Allocating the 'auidioPlayer' with the files url
    [self.audioPlayer play];// Playing 'audioPlayer'
}







/* the following websites listed below were used as guidence in the creation of this application:
https://www.youtube.com/watch?v=Eo7wDCyXU6g
https://www.youtube.com/watch?v=_cOIU3bHnhs
https://www.youtube.com/watch?v=msx_36lc9lA
    The three youtube links were the main guidlines on how to get my images moving and more importantly on how to detect if the objects have intersected each other
https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
    This website was vital and used throughout the whole application. It gave advice on the type of format my veribals should be
 */




@end
