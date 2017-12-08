//
//  GamePlay.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface GamePlay : UIViewController
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@property(weak, nonatomic) IBOutlet UIImageView *CharacterImage;
//The outlet code connection of the 'CharacterImage' to that of the character image in the GamePlay ViewController
@property(weak, nonatomic) IBOutlet UIImageView *ObjectImage;
//The outlet code connection of the 'ObjectImage' to that of the object image in the GamePlay ViewController
@property(weak, nonatomic) IBOutlet UILabel *CurrentScore;
//The outlet code connection of the 'CurrentScore' to that of the curretn score label in the GamePlay ViewController
@property(weak, nonatomic) IBOutlet UILabel *BestScore;
//The outlet code connection of the 'BestScore' to that of the best score label in the GamePlay ViewController
@property (strong, nonatomic) IBOutlet UIButton *TouchToBegin;
//The outlet code connection of the 'TouchToBegin' to that of the touch to begin button in the GamePlay ViewController
@property(strong, nonatomic) NSTimer *Object;
//Creating NSTimer object called 'Object'
@property (strong, nonatomic) IBOutlet UIImageView *Background;
//The outlet code connection of the 'Background' to that of the background image in the GamePlay ViewController
@property (weak, nonatomic) IBOutlet UIImageView *TunnelTop;
//The outlet code connection of the 'TunnelTop' to that of the top tunnel image in the GamePlay ViewController
@property (weak, nonatomic) IBOutlet UIImageView *TunnelMiddel;
//The outlet code connection of the 'TunnelMiddel' to that of the middel tunnel image in the GamePlay ViewController
@property (weak, nonatomic) IBOutlet UIImageView *TunnelBottom;
//The outlet code connection of the 'TunnelBottom' to that of the bottom tunnel image in the GamePlay ViewController


@property int ObjectPostion;// Creting an integer veribal called 'ObjectPostions'
@property int CharacterValue;// creating an integer veribal called 'CharacterValue'
@property int RandObject;// creating an integer veribal called 'RandObject'
@property int Svalue;// creating an integer veribal called 'Svalue'
@property int Bvalue;// creating an integer veribal called 'Bvalue'
@property int Speed;// creating an integer veribal called 'Speed'
@property int SpecialPoints;// creating an integer veribal called 'SpecialPoints'
@property int RoundsPlayed;// creating an integer veribal called 'RoundsPlayed'
@property bool NotIntersected;// creating an integer veribal called 'NotIntersected'
@property bool ObjectGenerated;// creating an integer veribal called ''
@property int ObjectTop;// creating an integer veribal called 'ObjectTop'
@property int ObjectMiddel;// creating an integer veribal called 'ObjectMiddel'
@property int ObjectBottom;// creating an integer veribal called 'ObjectBottom'
@property int ObjectX;// creating an integer veribal called 'ObjectX'



- (IBAction)DownButton:(UIButton *)sender;// IBAction for the down button/image
- (IBAction)UpButton:(UIButton *)sender;// IBAction for the up button/image
- (IBAction)TouchToBegin:(UIButton *)sender;// IBAction for the 'touch to begin' button

-(void)gameOver;// Creating a method called 'gameOver'
-(void)characterSelectedImages;// Creating a method called 'characterSelectedImages'
-(void)objectSelectedImages;// Creating a method called 'objectSelectedImages'
-(void)ObjectLocation;// Creating a method called 'objectLocation'
-(void)DeviceSelected;//Creating a method called 'DeviceSelected'
-(void)BackgroundMusic;// Creating a method called 'BackgroundMusic'
@end
