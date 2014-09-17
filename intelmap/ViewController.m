//
//  ViewController.m
//  intelmap
//
//  Created by Masataka Okihara on 2014/09/17.
//  Copyright (c) 2014年 Masataka Okihara. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MKMapView *mapView = [[MKMapView alloc] init];
    mapView.frame = 	CGRectMake(0,0,320,480);
    
    // 表示位置を設定（ここでは東京都庁の経度緯度を例としています）
    CLLocationCoordinate2D co;
    co.latitude = 35658026 / 1E6; // 経度
    co.longitude = 139701237 / 1E6; // 緯度
    [mapView setCenterCoordinate:co animated:NO];
//    mapView.mapType = MKMapTypeSatellite;
//    mapView.showsBuildings = YES;
    
    // ファイルハンドルを作成する
    NSString *fileName = @"intel_entities.json";
    NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    NSError *error;;
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    
    NSDictionary* result = [jsonObj objectForKey:@"result"];
    NSDictionary* map    = [result objectForKey:@"map"];
    
    for (NSDictionary *key in map)
    {
        
        NSDictionary* m = [map objectForKey:key];
        NSArray *gameEntities = [m objectForKey:@"gameEntities"];
        
        if (!gameEntities) {
            continue;
        }

        int count = 0;
        for (NSArray *info in gameEntities)
        {
            NSDictionary *obj = [info objectAtIndex:2];
            
            NSString* type = [obj objectForKey:@"type"];
            if ( ![type isEqual:@"portal"] ) {
                continue;
            }

            double lat = [[obj objectForKey:@"latE6"] doubleValue];
            double lng = [[obj objectForKey:@"lngE6"] doubleValue];

            CLLocationCoordinate2D co;
            co.latitude = lat / 1E6; // 経度
            co.longitude = lng / 1E6; // 緯度
            
            NSString *title = [obj objectForKey:@"title"];

            MyAnnotation *anno = [[MyAnnotation alloc] initWithLocationCoordinate:co title:title subtitle:@"body"];
            [mapView addAnnotation:anno];
            
            count++;
            if (count > 3000) {
                break;
            }
        }
    }
    
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
