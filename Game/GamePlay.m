

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
    [self character_objectImgaes];
    _ObjectImage.hidden = true;
    _CharacterImage.hidden = true;
    
    
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
    _Object = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(objectMoving) userInfo:nil repeats:YES];
    [self repositionObject];
    
}


-(void)objectMoving{
    _ObjectImage.center = CGPointMake(_ObjectImage.center.x -1, _ObjectImage.center.y);
    if(_ObjectImage.center.x == -20){
        [self repositionObject];
    }
    if(CGRectIntersectsRect(_ObjectImage.frame, _CharacterImage.frame)){
        _ObjectImage.hidden = true;
        _CharacterImage.hidden = true;
        [self gameOver];
    }
}

-(void)repositionObject{
    _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",_Svalue];
    
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
    _ObjectImage.center = CGPointMake(310, _RandObject);
    _Svalue = _Svalue + 1;
}



-(void)gameOver{
    GamePlay *NVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GameOver"];
    [self presentViewController:NVC animated:YES completion:nil];
    
    
}

-(void)character_objectImgaes;{
    
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



@end
