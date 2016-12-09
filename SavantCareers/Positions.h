//
//  Positions.h
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/20/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Positions : NSObject

+ (id)itemWithTitle:(NSString *)title withLocation:(NSString *)location;
- (id)initWithTitle:(NSString *)title withLocation:(NSString *)location;

@property (nonatomic, copy) NSString *positionTitle;
@property (nonatomic, copy) NSString *positionLocation;

@end
