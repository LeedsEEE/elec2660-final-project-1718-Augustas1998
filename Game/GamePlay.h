//
//  GamePlay.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>
@interface GamePlay : UIViewController

@property(weak, nonatomic) IBOutlet UIImageView *CharacterImage;
@property(weak, nonatomic) IBOutlet UIImageView *ObjectImage;
@property(weak, nonatomic) IBOutlet UILabel *CurrentScore;
@property(weak, nonatomic) IBOutlet UILabel *BestScore;
@property (strong, nonatomic) IBOutlet UIButton *TouchToBegin;
@property(strong, nonatomic) NSTimer *Object;
@property (strong, nonatomic) IBOutlet UIImageView *Background;
@property (weak, nonatomic) IBOutlet UIImageView *TunnelTop;
@property (weak, nonatomic) IBOutlet UIImageView *TunnelMiddel;
@property (weak, nonatomic) IBOutlet UIImageView *TunnelBottom;


@property int ObjectPostion;
@property int CharacterValue;
@property int RandObject;
@property int Svalue;
@property int Bvalue;
@property int Speed;
@property int SpecialPoints;
@property int RoundsPlayed;
@property bool A;
@property bool T;
@property int ObjectTop, ObjectMiddel, ObjectBottom, ObjectX;



- (IBAction)DownButton:(UIButton *)sender;
- (IBAction)UpButton:(UIButton *)sender;
- (IBAction)TouchToBegin:(UIButton *)sender;

-(void)gameOver;
-(void)characterSelectedImages;
-(void)objectSelectedImages;
-(void)ObjectLocation;
-(void)DeviceSelected;
@end
