//
//  User.m
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import "User.h"

@implementation User

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.passWord forKey:@"passWord"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.passWord = [aDecoder decodeObjectForKey:@"passWord"];
    }
    return self;
}
@end
