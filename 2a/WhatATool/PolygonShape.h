//
//  PolygonShape.h
//  WhatATool
//
//  Created by Bill Abel on 4/16/09.
//  Copyright 2009 Studio Pragmatica. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
	float angleInDegrees;
	float angleInRadians;
	NSString *name;
}

@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString *name;

- (void)setNumberOfSides:(int)value;
- (void)setMinimumNumberOfSides:(int)value;
- (void)setMaximumNumberOfSides:(int)value;
- (NSString *)description;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;

@end