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
    NSInteger CP_points = [[NSUserDefaults standardUserDefaults] integerForKey:@"Special"];
    NSInteger Bvalue = [[NSUserDefaults standardUserDefaults] integerForKey:@"Bestvalue"];
    NSUInteger RoundsPlayed = [[NSUserDefaults standardUserDefaults] integerForKey:@"AmountPlayed"];
    float AverageScore = [[NSUserDefaults standardUserDefaults] floatForKey:@"AverageValue"];
    
    _SpecialPointsLabel.text = [NSString stringWithFormat:@"Character Points: %li", CP_points];
    _BestScoreLabel.text = [NSString stringWithFormat:@"Best: %li",Bvalue];
    _RoundsPlayedLabel.text = [NSString stringWithFormat:@"Rounds Played: %li", RoundsPlayed];
    _AvrageScoreLabel.text = [NSString stringWithFormat:@"Average Score: %.2f ",AverageScore];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
