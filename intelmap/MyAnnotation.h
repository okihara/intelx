//
//  MyAnnotation.h
//  intelmap
//
//  Created by Masataka Okihara on 2014/09/17.
//  Copyright (c) 2014年 Masataka Okihara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>
{
    NSString *title;
    NSString *subtitle;
}

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle subtitle:(NSString *)_annotationannSubtitle;
@end
