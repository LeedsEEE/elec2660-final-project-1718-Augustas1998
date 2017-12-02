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
    NSInteger CScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"10"];
    _CurrentScore.text = [NSString stringWithFormat:@"Score: %li",(long)CScore];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
