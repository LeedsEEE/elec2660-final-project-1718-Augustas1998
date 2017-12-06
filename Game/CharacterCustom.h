//
//  CharacterCustom.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CharacterCustom : UIViewController
@property (strong, nonatomic) NSString *CharSelect;// Creating the nsstring veribal 'CharSelect'
@property int SpecialPoints;// Creating an integar value 'SpecialPoints'

@property (strong, nonatomic) IBOutlet UILabel *A_L_pacman;
//The outlet code connection of the availble/locked label to that of the  PacMan's A/L label in CharacterCustom ViewController
@property (strong, nonatomic) IBOutlet UILabel *A_L_contra;
//The outlet code connection of the availble/locked label to that of the  Contras's A/L label in ObjectCustom ViewController
@property (strong, nonatomic) IBOutlet UILabel *A_L_Donkey;
//The outlet code connection of the availble/locked label to that of the  Donkey-Kong's A/L label in ObjectCustom ViewController
@property (strong, nonatomic) IBOutlet UILabel *A_L_mario;
//The outlet code connection of the availble/locked label to that of the  Mario's A/L label in ObjectCustom ViewController






- (IBAction)Character_StickMan:(UIButton *)sender;// IBAction for the StickMan button/image
- (IBAction)Character_PanMan:(UIButton *)sender;// IBaction for the PacMan button/image
- (IBAction)Character_Contra:(UIButton *)sender;// IBaction for the contra button/image
- (IBAction)Character_Donkey:(UIButton *)sender;// IBaction for the donkey-Kong button/image
- (IBAction)Character_Mario:(UIButton *)sender;// IBaction for the Mario button/image

-(void)CharacterSelected;//Creating a method called 'CharacterSelected'
@end
