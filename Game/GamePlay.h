//
//  GamePlay.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>

float CharacterPostion;
float ObjectPostion;
int Svalue;
int CharValue;

@interface GamePlay : UIViewController

@property(weak, nonatomic) IBOutlet UIImageView *CharacterImage;
@property(weak, nonatomic) IBOutlet UIImageView *ObjectImage;
@property(weak, nonatomic) IBOutlet UILabel *ScoreValue;
@property(strong, nonatomic) NSTimer *Character;
@property(strong, nonatomic) NSTimer *Object;

- (IBAction)DownButton:(UIButton *)sender;
- (IBAction)UpButton:(UIButton *)sender;
- (IBAction)StartGame:(UIButton *)sender;


-(void)characterMoving;
-(void)objectMoving;
-(void)repositionObject;
-(void)gameOver;
-(void)character_objectImgaes;

@end
