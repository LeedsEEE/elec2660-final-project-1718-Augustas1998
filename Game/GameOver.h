//
//  GameOver.h
//  Game
//
//  Created by Augustas Jackevic on 23/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameOver : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *CurrentScore;
@property (strong, nonatomic) IBOutlet UILabel *BestScore;
@property float AverageScore;
@property float AllScores;

@end
