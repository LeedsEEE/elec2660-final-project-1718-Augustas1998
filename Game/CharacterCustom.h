//
//  CharacterCustom.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CharacterCustom : UIViewController
@property (strong, nonatomic) NSString *CharSelect;
@property int SpecialPoints;

- (IBAction)Character_StickMan:(UIButton *)sender;
- (IBAction)Character_PanMan:(UIButton *)sender;
- (IBAction)Character_Contra:(UIButton *)sender;
- (IBAction)Character_Donkey:(UIButton *)sender;
- (IBAction)Character_Mario:(UIButton *)sender;

-(void)CharacterSelected;
@end
