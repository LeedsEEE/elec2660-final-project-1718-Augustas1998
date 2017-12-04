

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
    _A = true;
    
    _SpecialPoints = [[NSUserDefaults standardUserDefaults] integerForKey:@"Special"];
    _Bvalue = [[NSUserDefaults standardUserDefaults] integerForKey:@"Bestvalue"];
    _RoundsPlayed = [[NSUserDefaults standardUserDefaults] integerForKey:@"AmountPlayed"];
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
            _Speed = 1;
        }
        else if( _Svalue >= 10 && _Svalue < 30){
            _Speed = 2;
        }
        else if (_Svalue >= 30 && _Svalue < 50){
            _Speed = 3;
        }
        else{
            _Speed = 5;
        }
        _ObjectImage.center = CGPointMake(_ObjectImage.center.x -_Speed, _ObjectImage.center.y);
        if(_ObjectImage.center.x == -30){
            [self objectSelectedImages];
            NSUInteger RandomValue = arc4random_uniform(3);
            if (RandomValue == 1) {
                _RandObject = 305;
            }
            else if( RandomValue == 2){
                _RandObject = 215;
            }
            else{
                _RandObject = 125;
            }
            _Svalue = _Svalue + 1;
            _BestScore.text = [NSString stringWithFormat:@"Best: %i", _Bvalue];
            if(_Svalue >= _Bvalue){
                [[NSUserDefaults standardUserDefaults]setInteger: _Bvalue forKey:@"Bestvalue"];
                _Bvalue = _Svalue + 1;

            }
           _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];
           [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"10"];
            _ObjectImage.center = CGPointMake(600,_RandObject);
        }
        if(CGRectIntersectsRect(_ObjectImage.frame, _CharacterImage.frame)){
            
            if(_T ==true){
                [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"10"];
                _A = false;
                float FinalScore = _Svalue;
                [[NSUserDefaults standardUserDefaults] setFloat:FinalScore forKey:@"FinalScore"];
                [self gameOver];
                
            }
            
            else if (_T==false){
                _SpecialPoints = _SpecialPoints + 1;
                [[NSUserDefaults standardUserDefaults]setInteger:_SpecialPoints forKey:@"Special"];
                [self objectSelectedImages];
                NSUInteger RandomValue = arc4random_uniform(3);
                int RandObjects;
                
                if (RandomValue == 1) {
                    RandObjects = 305;
                }
                
                else if( RandomValue == 2){
                    RandObjects = 215;
                }
                
                else{
                    RandObjects = 125;
                }
                
                _ObjectImage.center = CGPointMake(600,RandObjects);
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

-(void)characterSelectedImages;{
    
    NSString *CharSelect = [[NSUserDefaults standardUserDefaults] stringForKey:@"CharacterSelected"];
    if ([CharSelect  isEqual: @"StickMan"]) {
        [_CharacterImage setImage: [UIImage imageNamed:@"stickMAN.png"]];
    }
    else if ([CharSelect  isEqual: @"PacMan"]) {
        [_CharacterImage setImage: [UIImage imageNamed:@"PacMan_Icon.png"]];
    }
    else if ([CharSelect isEqualToString:@"Contra"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"Contra_Icon.png"]];
    }
    else if ([CharSelect isEqualToString:@"Donkey-Kong"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"Donkey_Icon.png"]];
    }
    else if ([CharSelect isEqualToString:@"Mario"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"Mario_Icon.png"]];
    }
}

-(void)objectSelectedImages{
    NSString *objectSelect = [[NSUserDefaults standardUserDefaults] stringForKey:@"ObjectSelected"];
    NSUInteger R = arc4random_uniform(10);

    
    if ([objectSelect isEqualToString:@"StickMan_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Red_Icon.png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"GreenBall_Icon.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"PacMan_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Goast_Icon.png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Strawberry.png"]];
        }
    }

    else if ([objectSelect isEqualToString:@"Contra_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"ContraBoss_Icon.png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Contra_s_Icon.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"Donkey-Kong_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Barrel_Icon..png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Banana_Icon.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"Mario_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Goomba_Icon.png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Mushroom.gif"]];
        }
    }

}
















@end
