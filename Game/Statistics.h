//
//  Statistics.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Statistics : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *BestScoreLabel; //The outlet code connection of the best score label to that of the Statistics ViewController
@property (strong, nonatomic) IBOutlet UILabel *SpecialPointsLabel; //The outlet code connection of the special points label to that of the Statistics ViewController
@property (strong, nonatomic) IBOutlet UILabel *RoundsPlayedLabel; //The outlet code connection of the rounds played label to that of the Statistics ViewController
@property (strong, nonatomic) IBOutlet UILabel *AvrageScoreLabel; //The outlet code connection of the average score label to that of the Statistics ViewController

@end
