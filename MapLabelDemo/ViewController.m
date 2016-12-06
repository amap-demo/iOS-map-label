//
//  ViewController.m
//  MapLabelDemo
//
//  Created by xiaoming han on 16/11/3.
//  Copyright © 2016年 AutoNavi. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>


@interface ViewController ()<MAMapViewDelegate>

@property (strong, nonatomic) MAMapView *mapView;

//xib view
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.containerView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    self.containerView.layer.cornerRadius = 10;
    
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;

    [self.view addSubview:self.mapView];
    [self.view sendSubviewToBack:self.mapView];
    
    //test
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    MAMapStatus *mapStatus = [MAMapStatus statusWithCenterCoordinate:CLLocationCoordinate2DMake(39.91, 116.396) zoomLevel:18.3 rotationDegree:7 cameraDegree:57 screenAnchor:CGPointMake(0.5, 0.5)];
    
    [self.mapView setMapStatus:mapStatus animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - action

- (IBAction)showLabelSwitch:(id)sender {
    UISwitch *showSwitch = (UISwitch *)sender;
    self.mapView.showsLabels = showSwitch.on;
}



@end
