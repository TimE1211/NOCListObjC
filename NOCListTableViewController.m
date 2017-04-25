//
//  NOCListTableViewController.m
//  NOCList
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "NOCListTableViewController.h"
#import "Agent.h"
#import "AgentDetailViewController.h"

@interface NOCListTableViewController ()

@property (nonatomic) NSMutableArray *agents;

@end

@implementation NOCListTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.agents = [[NSMutableArray alloc] init];
  [self loadGroceries];
}
- (void)loadGroceries
{
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"NOC" ofType:@"json"];
  
  NSArray * agentsJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:0 error:nil];
  
  for (NSDictionary *aDictionary in agentsJSON)
  {
    Agent *anAgent = [Agent agentWithDictionary:aDictionary];
    [self.agents addObject:anAgent];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//return type//name                       //argument type//argument
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//return type//name                       //argument type//argument
{
  return self.agents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//return type      //name      //argument type//argument                      //argument type//argument
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AgentCell" forIndexPath:indexPath];
  
  // Configure the cell...
  Agent *anAgent = self.agents[indexPath.row];
  cell.textLabel.text = anAgent.coverName;
  cell.detailTextLabel.text = anAgent.realName;
  
  return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"ShowDetailViewSegue"])
  {
    AgentDetailViewController *detailVC = [segue destinationViewController];
    
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    Agent *selectedAgent = self.agents[indexPath.row];
    
    detailVC.agent = selectedAgent;
  }
}

@end
