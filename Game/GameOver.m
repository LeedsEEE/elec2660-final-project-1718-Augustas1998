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
    _AllScores = [[NSUserDefaults standardUserDefaults] floatForKey:@"AllValues"];
    NSInteger FinalScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"FinalScore"];
    NSInteger CScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"10"];
    NSInteger Bvalue = [[NSUserDefaults standardUserDefaults] integerForKey:@"Bestvalue"];
    NSUInteger RoundsPlayed = [[NSUserDefaults standardUserDefaults] integerForKey:@"AmountPlayed"];
    
    _CurrentScore.text = [NSString stringWithFormat:@"Score: %li",CScore];
    _BestScore.text = [NSString stringWithFormat:@"Best: %li", Bvalue ];
    
    _AllScores = _AllScores + FinalScore;
    [[NSUserDefaults standardUserDefaults]setFloat:_AllScores forKey:@"AllValues"];
    
    _AverageScore = _AllScores / RoundsPlayed;
    [[NSUserDefaults standardUserDefaults]setFloat:_AverageScore forKey:@"AverageValue"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
