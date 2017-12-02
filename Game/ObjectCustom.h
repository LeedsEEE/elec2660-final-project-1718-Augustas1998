//
//  ObjectCustom.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjectCustom : UIViewController
@property int SepecialPoints;
@property (strong, nonatomic) NSString *ObjectSelect;

- (IBAction)Object_StickMan:(UIButton *)sender;
- (IBAction)Object_PacMan:(UIButton *)sender;
- (IBAction)Object_Contra:(UIButton *)sender;
- (IBAction)Object_Donkey:(UIButton *)sender;
- (IBAction)Object_Mario:(UIButton *)sender;

-(void)ObjectSelected;

@end
