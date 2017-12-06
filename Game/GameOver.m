//
//  GameOver.m
//  Game
//
//  Created by Augustas Jackevic on 23/11/2017.
//  Copyright © 2017 Augustas Jackevic (el16a2j). All rights reserved.
//

#import "GameOver.h"

@interface GameOver ()

@end

@implementation GameOver

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     This class recives and sets a number of NSUserDefault types. This is maninly due to reciving and sending data
     that has to be remembered through the application. Even when the application is restarted.
     I used the website:stackoverflow.com/questions/11508247/passing-a-variable-declared-in-one-class-to-another-class 
     to guid me on how to send and retrive data with NSUserDefault
    */
    
    
    _AllScores = [[NSUserDefaults standardUserDefaults] floatForKey:@"AllValues"];
    //Setting the float 'AllScores' value to that of the called upon value in NSUserDefault "AllValues"
    NSInteger FinalScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"FinalScore"];
    // Creating a 'FinalScore' integer, and giving it the value of that of NSUserDefault "FinalScore"
    NSInteger CurrentScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"10"];
    // Creating a 'CurrentScore' integer, and giving it the value of that of NSUserDefault "10"
    NSInteger Bvalue = [[NSUserDefaults standardUserDefaults] integerForKey:@"Bestvalue"];
    // Creating a 'Bvalue' integer, and giving it the value of that of NSUserDefault "Bestvalue"
    NSUInteger RoundsPlayed = [[NSUserDefaults standardUserDefaults] integerForKey:@"AmountPlayed"];
    // Creating a 'RoundsPlayed' integer, and giving it the value of that of NSUserDefault "AmountPlayed"
    
    _CurrentScore.text = [NSString stringWithFormat:@"Score: %li",CurrentScore];
    //Displaying the 'CurrentScore' value and text in the current score label
    _BestScore.text = [NSString stringWithFormat:@"Best: %li", Bvalue ];
    //Displaying the 'Bvalue' value and text in the best score label
    
    _AllScores = _AllScores + FinalScore;// Setting the 'AllScores' value, to the of the previous 'AllScore' value, plus the 'FianlScore' value the user achived in the game. This then sets up all the 'FianleScore' values the user obtained to that of 'AllScores'
    [[NSUserDefaults standardUserDefaults]setFloat:_AllScores forKey:@"AllValues"];
    //Setting the 'AllScores' value to that of NSUserDefaults "AllValue'.
    
    _AverageScore = _AllScores / RoundsPlayed;
    //Calculating the average score. this is done by deviding all the score values by the amount of rounds played, and setting the resulting value to 'AverageScore'
    [[NSUserDefaults standardUserDefaults]setFloat:_AverageScore forKey:@"AverageValue"];
    //Setting the 'AverageScore' value to that of NSUserDefault "AverageValue"
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
