//
//  Positions.m
//  SavantCareers
//
//  Created by Shishira Ramesh on 7/20/14.
//  Copyright (c) 2014 Shishira Ramesh. All rights reserved.
//

#import "Positions.h"

@implementation Positions

+ (id)itemWithTitle:(NSString *)title withLocation:(NSString *)location
{
    return [[self alloc] initWithTitle:(NSString *)title withLocation:(NSString *)location];
}

- (id)initWithTitle:(NSString *)title withLocation:(NSString *)location
{
    if ((self = [super init]))
    {
        _positionTitle = title;
        _positionLocation = location;
    }
    
    return self;
}


@end
