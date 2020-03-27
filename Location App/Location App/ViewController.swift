//
//  ViewController.swift
//  Location App
//
//  Created by Ethan Weinrot on 3/26/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    let starting_lat = 34.040544
    let starting_long = -118.407266
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.delegate = self
        
        let startingCoords = CLLocationCoordinate2D(latitude: starting_lat, longitude: starting_long)
        let point = MKMapPoint(startingCoords)
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        let factor = 0.5
        zoom(factor)
    }
    

    @IBAction func zoomOut(_ sender: Any) {
        let factor = 2.0
        zoom(factor)
    }
    
    
    func zoom(_ zoomFactor: Double) {
        let region = mapView.region
        let span = region.span
        let newLat = span.latitudeDelta * zoomFactor
        let newLong = span.longitudeDelta * zoomFactor
        let newSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    
    @IBAction func findMe(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let homeLoc = CLLocationCoordinate2D(latitude: starting_lat, longitude: starting_long)
        let homePoint = MKMapPoint(homeLoc)
        if rect.contains(homePoint) {
            locationLabel.text = "You're at Ethan's home!"
        } else {
            locationLabel.text = "You're not at Ethan's home?"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let span = mapView.region.span
    let coords = locations.suffix(1)[0].coordinate
    let newRegion = MKCoordinateRegion(center: coords, span: span)
    mapView.setRegion(newRegion, animated: true)
    
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}

