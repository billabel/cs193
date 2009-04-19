//
//  PolygonShape.m
//  WhatATool
//
//  Created by Bill Abel on 4/16/09.
//  Copyright 2009 Studio Pragmatica. All rights reserved.
//

#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (float)angleInDegrees {
	return (180 * (numberOfSides - 2) / numberOfSides);
}

- (float)angleInRadians {
	return ([self angleInDegrees] / (180 / M_PI));
}

- (void)setNumberOfSides:(int)value {
	if ((value > minimumNumberOfSides) && (value <= maximumNumberOfSides)) {
		numberOfSides = value;
	} else {
		//NSLog(@"Invalid number of sides: %@ is %@", value, (value > maximumNumberOfSides) ? [@"greater than the maximum of %@ allowed", maximumNumberOfSides] : [@"less than the minimum of %@ allowed", minimumNumberOfSides] );
	}
}

- (void)setMinimumNumberOfSides:(int)value {
	if (value > 2) {
		minimumNumberOfSides = value;
	} else {
		NSLog(@"Must be greater than 2");
	}
}

- (void)setMaximumNumberOfSides:(int)value {
	if (value <= 12) {
		maximumNumberOfSides = value;
	} else {
		NSLog(@"Must be less than or equal to 12");
	}	
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	if (self = [super init]) {
		if (min) {
			minimumNumberOfSides = min;
		} else {
			minimumNumberOfSides = 3;
		}
		if (max) {
			maximumNumberOfSides = max;
		} else {
			maximumNumberOfSides = 12;
		}
		if (sides) {
			numberOfSides = sides;
		} else {
			numberOfSides = ((sides > maximumNumberOfSides) && (sides <= maximumNumberOfSides)) ? sides : 4;
		}
	}
	return self;
}

- (id)init {
	return [self initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:12];
}

- (NSString *)name {
	switch (numberOfSides) {
		case 3 : return @"triangle";
			break;
		case 4 : return @"square";
			break;
		case 5 : return @"pentagon";
			break;
		case 6 : return @"hexagon";
			break;
		case 7 : return @"heptagon";
			break;
		case 8 : return @"octagon";
			break;
		case 9 : return @"ennagon";
			break;
		case 10 : return @"decagon";
			break;
		case 11 : return @"hendecagon";
			break;
		case 12 : return @"dodecagon";
			break;
	}
	return @"unknown"; //don't know if this is correct?
}

- (NSString *)description {
	return [NSString stringWithFormat:@"Hi, I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians)", [self numberOfSides], [self name], [self angleInDegrees], [self angleInRadians]];
}

@end
