//
//  ViewController.swift
//  MapLabelDemo-swift
//
//  Created by eidan on 16/12/6.
//  Copyright © 2016年 AutoNavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MAMapViewDelegate{

    @IBOutlet weak var containerView: UIView!
    
    var mapView: MAMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.containerView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4);
        self.containerView.layer.cornerRadius = 10;
        
        self.mapView = MAMapView(frame: self.view.bounds);
        self.mapView.autoresizingMask = [UIViewAutoresizing.flexibleWidth , UIViewAutoresizing.flexibleHeight];
        self.mapView.delegate = self;
        
        self.view.addSubview(mapView);
        self.view.sendSubview(toBack: mapView);
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated);
        
        let mapStatus = MAMapStatus(center: CLLocationCoordinate2D.init(latitude: 39.91, longitude: 116.396), zoomLevel: 18.3, rotationDegree: 7, cameraDegree: 57, screenAnchor: CGPoint.init(x: 0.5, y: 0.5));
        
        self.mapView.setMapStatus(mapStatus, animated: false);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showLabelSwitch(_ sender: UISwitch) {
        self.mapView.isShowsLabels = sender.isOn;
    }


}

