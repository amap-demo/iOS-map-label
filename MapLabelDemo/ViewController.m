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

@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;

    [self.view addSubview:self.mapView];
    
    
    UIView *switchsPannelView = [self makeSwitchsPannelView];
    switchsPannelView.center = CGPointMake( CGRectGetMidX(switchsPannelView.bounds) + 10,
                                           self.view.bounds.size.height -  CGRectGetMidY(switchsPannelView.bounds) - 20);
    
    switchsPannelView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:switchsPannelView];
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

- (UIView *)makeSwitchsPannelView
{
    UIView *ret = [[UIView alloc] initWithFrame:CGRectZero];
    ret.backgroundColor = [UIColor whiteColor];
    
    
    UISwitch *swt1 = [[UISwitch alloc] init];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, CGRectGetHeight(swt1.bounds))];
    label1.text = @"showsLabels:";
    [label1 sizeToFit];
    
    
    [ret addSubview:label1];
    [ret addSubview:swt1];
    
    // layout
    CGRect tempFrame = swt1.frame;
    tempFrame.origin.x = CGRectGetMaxX(label1.frame) + 5;
    swt1.frame = tempFrame;
    
    
    //
    [swt1 addTarget:self action:@selector(actionLabel:) forControlEvents:UIControlEventValueChanged];
    
    [swt1 setOn:self.mapView.showsLabels];
    
    ret.bounds = CGRectMake(0, 0, CGRectGetMaxX(swt1.frame), CGRectGetMaxY(swt1.frame));
    
    return ret;
}

#pragma - action

- (void)actionLabel:(UISwitch *)sender
{
    self.mapView.showsLabels = sender.on;
}


@end
