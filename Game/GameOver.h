//
//  GameOver.h
//  Game
//
//  Created by Augustas Jackevic on 23/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameOver : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *CurrentScore; //The outlet code connection of the current score label to that of the gameOver ViewController
@property (strong, nonatomic) IBOutlet UILabel *BestScore;//The outlet code connection of the best score label to that of the gameOver ViewController
@property float AverageScore; //Creating a float veribal called AveragScore
@property float AllScores; //Creating a float veribal called AllScores, which containes all the score values. This is then used in the calculation of average score.

@end
