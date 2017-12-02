

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
}







- (IBAction)DownButton:(UIButton *)sender {
    if (_CharacterValue < 1){
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y + 100);
        _CharacterValue = _CharacterValue +1;
    }else{
        nil;
    }
    
}
- (IBAction)UpButton:(UIButton *)sender {
    if (_CharacterValue > -1){
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y - 100);
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
        _ObjectImage.center = CGPointMake(_ObjectImage.center.x -1, _ObjectImage.center.y);
        if(_ObjectImage.center.x == -20){
            [self objectSelectedImages];
            NSUInteger RandomValue = arc4random_uniform(3);
            if (RandomValue == 1) {
                _RandObject = 430;
            }
            else if( RandomValue == 2){
                _RandObject = 330;
            }
            else{
                _RandObject = 230;
            }
            _Svalue = _Svalue + 1;
           _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];
           [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"10"];
            _ObjectImage.center = CGPointMake(310,_RandObject);
        }
        if(CGRectIntersectsRect(_ObjectImage.frame, _CharacterImage.frame)){
            if(_T ==true){
                [[NSUserDefaults standardUserDefaults]setInteger:_Svalue forKey:@"10"];
                _A = false;
                [self gameOver];
            }
            else if (_T==false){
                [self objectSelectedImages];
                NSUInteger RandomValue = arc4random_uniform(3);
                int RandObjects;
                if (RandomValue == 1) {
                    RandObjects = 430;
                }
                else if( RandomValue == 2){
                    RandObjects = 330;
                }
                else{
                    RandObjects = 230;
                }
                _ObjectImage.center = CGPointMake(310,RandObjects);
                _Svalue = _Svalue + 1;
                _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];
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
        [_CharacterImage setImage: [UIImage imageNamed:@"Stick-man logo.png"]];
    }
    else if ([CharSelect  isEqual: @"PacMan"]) {
        [_CharacterImage setImage: [UIImage imageNamed:@"Pac-man logo.png"]];
    }
    else if ([CharSelect isEqualToString:@"Contra"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"Contra logo.png"]];
    }
    else if ([CharSelect isEqualToString:@"Donkey-Kong"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"Donkey-Kong logo.png"]];
    }
    else if ([CharSelect isEqualToString:@"Mario"]){
        [_CharacterImage setImage: [UIImage imageNamed:@"Mario logo.png"]];
    }
}

-(void)objectSelectedImages{
    NSString *objectSelect = [[NSUserDefaults standardUserDefaults] stringForKey:@"ObjectSelected"];
    NSUInteger R = arc4random_uniform(10);
    if ([objectSelect isEqualToString:@"StickMan_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Red ball.png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Green ball.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"PacMan_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"goast-pac.png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"fruit-pac.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"Contra_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"contra-boss.png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"Conta-s.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"Donkey-Kong_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"Barrel.jpg"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"banana.jpg.png"]];
        }
    }
    else if ([objectSelect isEqualToString:@"Mario_Theme"]){
        if (R > 1){
            _T = true;
            [_ObjectImage setImage:[UIImage imageNamed:@"goomba.png"]];
        }
        else{
            _T = false;
            [_ObjectImage setImage:[UIImage imageNamed:@"mashroom mario.png"]];
        }
    }

}
















@end
