//
//  Statistics.m
//  Game
//
//  Created by Augustas Jackevic [el16a2j] on 16/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "Statistics.h"

@interface Statistics ()

@end

@implementation Statistics

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     
     */
    NSInteger CP_points = [[NSUserDefaults standardUserDefaults] integerForKey:@"Special"];
    //Creating an interger veribal called 'CP_points' and assigning it the value of that stored in the called upon NSUserDefaults "Special"
    NSInteger Bvalue = [[NSUserDefaults standardUserDefaults] integerForKey:@"Bestvalue"];
    //Creating an interger veribal called 'Bvalue' and assigning it the value of that stored in the called upon NSUserDefaults "Bestvalue"
    NSUInteger RoundsPlayed = [[NSUserDefaults standardUserDefaults] integerForKey:@"AmountPlayed"];
    //Creating an interger veribal called 'RoundsPlayed'and assigning it the value of that stored in the called upon NSUserDefaults "AmountPlayed"
    float AverageScore = [[NSUserDefaults standardUserDefaults] floatForKey:@"AverageValue"];
    //Creating a float veribal called 'AverageScore' and assigning it the value of that stored in the called upon NSUserDefaults "AverageValue"
    
    _SpecialPointsLabel.text = [NSString stringWithFormat:@"Character Points: %li", CP_points];
    //Displaying the 'CP_points' value and text in the special ppoints label
    _BestScoreLabel.text = [NSString stringWithFormat:@"Best: %li",Bvalue];
    //Displaying the 'Bvalue' value and text in the best score label
    _RoundsPlayedLabel.text = [NSString stringWithFormat:@"Rounds Played: %li", RoundsPlayed];
    //Displaying the 'RoundsPlayed' and text in the rounds played label
    _AvrageScoreLabel.text = [NSString stringWithFormat:@"Average Score: %.2f ",AverageScore];
    //Displaying the 'AverageScore' and text in the average score label

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
