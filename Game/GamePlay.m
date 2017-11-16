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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)DownButton:(UIButton *)sender {
    if (CharValue < 1){
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y + 100);
        CharValue = CharValue +1;
    }else{
        nil;
    }
    
}


- (IBAction)UpButton:(UIButton *)sender {
    if (CharValue > -1){
        _CharacterImage.center = CGPointMake(_CharacterImage.center.x, _CharacterImage.center.y - 100);
        CharValue = CharValue - 1;
    }
    else{
        nil;
    }
}

- (IBAction)StartGame:(UIButton *)sender {
    _Object = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(objectMoving) userInfo:nil repeats:YES];
    [self repositionObject];
    
}



-(void)characterMoving{
    
}


-(void)objectMoving{
    _ObjectImage.center = CGPointMake(_ObjectImage.center.x -1, _ObjectImage.center.y);
    if(_ObjectImage.center.x == -20){
        [self repositionObject];
        Svalue = Svalue + 1;
    }
    
}

-(void)repositionObject{
    _ObjectImage.center = CGPointMake(300, 330);
    _ScoreValue.text = [NSString stringWithFormat:@"Score: %i",Svalue];
    
    
}



-(void)gameOver{
    
}

-(void)character_objectImgaes;{
    
}









@end
