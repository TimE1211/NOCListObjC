//
//  AgentDetailViewController.m
//  NOCList
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "AgentDetailViewController.h"

@interface AgentDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *coverNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *realNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessLevel;

@end

@implementation AgentDetailViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.coverNameLabel.text = self.agent.coverName;
  self.realNameLabel.text = self.agent.realName;
  self.accessLevel.text = [NSString stringWithFormat:@"Access Level: %ld", (long)self.agent.accessLevel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
