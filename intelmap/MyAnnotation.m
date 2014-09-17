//
//  MyAnnotation.m
//  intelmap
//
//  Created by Masataka Okihara on 2014/09/17.
//  Copyright (c) 2014年 Masataka Okihara. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle subtitle:(NSString *)_annotationannSubtitle
{
    coordinate = _coordinate;
    title    = _annotationTitle;
    subtitle = _annotationannSubtitle;
    
    return self;
}

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate NS_AVAILABLE(10_9, 4_0)
{
    coordinate = newCoordinate;
}

@end
