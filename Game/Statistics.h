//
//  Statistics.h
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Statistics : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *BestScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *SpecialPointsLabel;
@property (strong, nonatomic) IBOutlet UILabel *RoundsPlayedLabel;
@property (strong, nonatomic) IBOutlet UILabel *AvrageScoreLabel;

@end
