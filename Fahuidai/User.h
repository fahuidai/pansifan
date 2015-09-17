//
//  User.h
//  Fahuidai
//
//  Created by mortal on 15/9/16.
//  Copyright (c) 2015年 fahuidai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *passWord;

@end
