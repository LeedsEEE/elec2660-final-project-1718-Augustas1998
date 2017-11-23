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
    
}

- (IBAction)DownButton:(UIButton *)sender {
    if (CharacterValue < 1){
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y + 100);
        CharacterValue = CharacterValue +1;
    }else{
        nil;
    }
    
}


- (IBAction)UpButton:(UIButton *)sender {
    if (CharacterValue > -1){
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y - 100);
        CharacterValue = CharacterValue - 1;
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
    _CurrentScore.text = [NSString stringWithFormat:@"Score: %i",Svalue];
    
    NSUInteger RandomValue = arc4random_uniform(3);
    if (RandomValue == 1) {
        RandObject = 430;
    }
    else if( RandomValue == 2){
        RandObject = 330;
    }
    else{
        RandObject = 230;
    }
    _ObjectImage.center = CGPointMake(310, RandObject);
    Svalue = Svalue + 1;
}



-(void)gameOver{
    //GamePlay *viewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:@"GameOver"];
    
    
}

-(void)character_objectImgaes;{
    
}









@end
