//
//  ViewController.swift
//  Crossroads Finder
//
//  Created by Ethan Weinrot on 3/23/20.
//  Copyright © 2020 Ethan Weinrot. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    var CROSSROADS_LAT = 34.0240892
    var CROSSROADS_LONG = -118.4747321
    var name:String = ""

    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect =  MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func pyramids(_ sender: Any) {
        name = "The Pyramids of Giza"
        CROSSROADS_LAT = 29.9773
        CROSSROADS_LONG = 31.1325
        mapView.delegate = self
        let pyramidsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect =  MKMapRect(origin: pyramidsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func stonehenge(_ sender: Any) {
        name = "Stonehenge"
        CROSSROADS_LAT = 51.1789
        CROSSROADS_LONG = 1.8262
        mapView.delegate = self
        let stonehengePoint = MKMapPoint(CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect =  MKMapRect(origin: stonehengePoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }

    @IBAction func pisa(_ sender: Any) {
        name = "The Leaning Tower of Pisa"
        CROSSROADS_LAT = 43.7230
        CROSSROADS_LONG = 10.3966
        mapView.delegate = self
        let pisaPoint = MKMapPoint(CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect =  MKMapRect(origin: pisaPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    
    @IBAction func zoomOut(_ sender: Any) {
        let factor = 2.0
        zoom(factor)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        let factor = 0.5
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
    
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let location = CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)
        let point = MKMapPoint(location)
        if rect.contains(point) {
            print("Hey, there's \(name)!")
        } else {
            print("Where's \(name)?")
        }
    }
}

