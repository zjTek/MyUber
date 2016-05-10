//
//  Location.swift
//  MyUber
//
//  Created by Tek on 16/5/10.
//  Copyright © 2016年 Tek. All rights reserved.
//

import UIKit
import CoreLocation

class Location: NSObject, CLLocationManagerDelegate {
    
    
    var manager : CLLocationManager?

    
    func startLocation() -> Void {
        
        manager = CLLocationManager()
        
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.distanceFilter = 100
        
        manager?.startUpdatingLocation()
        manager?.requestAlwaysAuthorization()
    }
    
    

    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        Log(String(status))
    }
    
    func searchAddress(location:CLLocation) -> Void {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks:[CLPlacemark]?, error:NSError?) in
            
            
            if placemarks != nil {
                for mark in placemarks!{
                    Log(mark.name!)
                }
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        searchAddress(newLocation)
        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        searchAddress(locations[0])
        
        // stop updating
        
        manager.stopUpdatingLocation()
    }
    
}
