//
//  Agent.m
//  NOCList
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "Agent.h"

@implementation Agent

+ (Agent *)agentWithDictionary:(NSDictionary *)agentDictionary;
{
  Agent *anAgent = nil;
  if (agentDictionary)
  {
    anAgent = [[Agent alloc]init];
    anAgent.coverName = agentDictionary[@"coverName"];
    anAgent.realName = agentDictionary[@"realName"];
    anAgent.accessLevel = [agentDictionary[@"accessLevel"] integerValue];
  }
  return anAgent;
}
@end

