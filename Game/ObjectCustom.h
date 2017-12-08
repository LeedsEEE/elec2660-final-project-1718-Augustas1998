//
//  ObjectCustom.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjectCustom : UIViewController
@property int SpecialPoints; //Creating an integar veribal SpecialPoints
@property (strong, nonatomic) NSString *ObjectSelect; //Creating an nsstring veribal 'ObjectSelect'

@property (strong, nonatomic) IBOutlet UILabel *A_L_PacMan_theme;
//The outlet code connection of the availble/locked label to that of the  PacMan's theme A/L label in ObjectCustom ViewController
@property (strong, nonatomic) IBOutlet UILabel *A_L_contra_theme;
//The outlet code connection of the availble/locked label to that of the Contra's theme A/L label in ObjectCustom ViewController
@property (strong, nonatomic) IBOutlet UILabel *A_L_Donkey_theme;
//The outlet code connection of the availble/locked label to that of the A/L DonkeyKong's theme label in ObjectCustom ViewController
@property (strong, nonatomic) IBOutlet UILabel *A_L_Mario_theme;
//The outlet code connection of the availble/locked label to that of the Mario's theme A/L label in ObjectCustom ViewController

- (IBAction)Object_StickMan:(UIButton *)sender; //IBAction for the StickMan theme button/image
- (IBAction)Object_PacMan:(UIButton *)sender; //IBAction for the PacMan theme button/image
- (IBAction)Object_Contra:(UIButton *)sender; //IBAction for the Contra theme button/image
- (IBAction)Object_Donkey:(UIButton *)sender; //IBAction for the Donkey-Kong theme button/image
- (IBAction)Object_Mario:(UIButton *)sender; //IBAction for the Mario theme button/image

-(void)ObjectSelected; //Creating a method called 'ObjectSelected'

@end
