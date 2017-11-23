//
//  GamePlay.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>

int ObjectPostion;
int CharacterValue;
int RandObject;
int Svalue;
int Bvalue;
int SpecialPoints;

@interface GamePlay : UIViewController

@property(weak, nonatomic) IBOutlet UIImageView *CharacterImage;
@property(weak, nonatomic) IBOutlet UIImageView *ObjectImage;
@property(weak, nonatomic) IBOutlet UILabel *CurrentScore;
//@property(weak, nonatomic) IBOutlet UILabel *BestScore;
@property (strong, nonatomic) IBOutlet UIButton *TouchToBegin;
@property(strong, nonatomic) NSTimer *Object;


- (IBAction)DownButton:(UIButton *)sender;
- (IBAction)UpButton:(UIButton *)sender;
- (IBAction)TouchToBegin:(UIButton *)sender;



-(void)objectMoving;
-(void)repositionObject;
-(void)gameOver;
-(void)character_objectImgaes;

@end
