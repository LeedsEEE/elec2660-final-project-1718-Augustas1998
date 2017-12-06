

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
    _ObjectImage.hidden = true;
    _CharacterImage.hidden = true;
    [self characterSelectedImages];
    [self objectSelectedImages];
    [self DeviceSelected];
    _A = true;
    
    _SpecialPoints = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Special"];
    _Bvalue = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"Bestvalue"];
    _RoundsPlayed = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"AmountPlayed"];
    _CurrentScore.text = @"Score: 0";
    _BestScore.text = [NSString stringWithFormat:@"Best: %i",_Bvalue];
    _RoundsPlayed = _RoundsPlayed + 1;
    [[NSUserDefaults standardUserDefaults]setInteger:_RoundsPlayed forKey:@"AmountPlayed"];
    
}







- (IBAction)DownButton:(UIButton *)sender {
    if (_CharacterValue < 1){
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y + 90);
        _CharacterValue = _CharacterValue +1;
    }else{
        nil;
    }

}
- (IBAction)UpButton:(UIButton *)sender {
    if (_CharacterValue > -1){
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y - 90);
        _CharacterValue = _CharacterValue - 1;
    }
    else{
        nil;
    }
}








- (IBAction)TouchToBegin:(UIButton *)sender{
    _TouchToBegin.hidden = true;
    _ObjectImage.hidden = false;
    _CharacterImage.hidden = false;
    _Object = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(ObjectLocation) userInfo:nil repeats:YES];
    [self ObjectLocation];
    
}
-(void)ObjectLocation{
    if (_A == true){
        if( _Svalue >= 0 && _Svalue < 10){
            _Speed = 2;
        }
        else if( _Svalue >= 10 && _Svalue < 20){
            _Speed = 3;
        }
        else if (_Svalue >= 20 && _Svalue < 30){
            _Speed = 4;
        }
        else if (_Svalue >= 30 && _Svalue < 40){
            _Speed = 5;
        }
        else if (_Svalue >= 40 && _Svalue < 50){
            _Speed = 6;
        }
        else if (_Svalue >= 50 && _Svalue < 60){
            _Speed = 7;
        }
        else if (_Svalue >= 60 && _Svalue < 70){
            _Speed = 8;
        }
        else if (_Svalue >= 70 && _Svalue < 80){
            _Speed = 9;
        }
        else if (_Svalue >= 80 && _Svalue < 90){
            _Speed = 10;
        }
        else if (_Svalue >= 90 && _Svalue < 100){
            _Speed = 11;
        }
        else if (_Svalue >= 100 && _Svalue < 110){
            _Speed = 12;
        }
        else{
            _Speed = 13;
        }
        _ObjectImage.center = CGPointMake(_ObjectImage.center.x - _Speed, _ObjectImage.center.y);
        if(_ObjectImage.center.x <= -30){
            [self objectSelectedImages];
            NSUInteger RandomValue = arc4random_uniform(3);
            if (RandomValue == 1) {
                _RandObject = _ObjectBottom;
            }
            else if( RandomValue == 2){
                _RandObject = _ObjectMiddel;
            }
            else{
                _RandObject = _ObjectTop;
            }
            _Svalue = _Svalue + 1;
            _BestScore.text = [NSString stringWithFormat:@"Best: %i", _Bvalue];
            if(_Svalue >= _Bvalue){
                [[NSUserDefaults standardUserDefaults]setInteger: _Bvalue forKey:@"Bestvalue"];
                _Bvalue = _Svalue + 1;

            }
           _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];
           [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"10"];
            _ObjectImage.center = CGPointMake(_ObjectX,_RandObject);
        }
        if(CGRectIntersectsRect(_ObjectImage.frame, _CharacterImage.frame)){
            
            if(_ObjectGenerated ==true){
                [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"10"];
                _A = false;
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
