//
//  Agent.h
//  NOCList
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Agent : NSObject

@property (nonatomic) NSString *coverName;
@property (nonatomic) NSString *realName;
@property (assign) NSInteger accessLevel;

+ (Agent *)agentWithDictionary:(NSDictionary *)agentDictionary;

@end
