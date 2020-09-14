//
//  INOX.swift
//  Find seat
//
//  Created by MR9U2 on 8/25/20.
//  Copyright © 2020 MR9U2. All rights reserved.
//

import UIKit
import MapKit
class INOX: UIView {

    @IBOutlet weak var mapkit: MKMapView!
    @IBOutlet weak var img: UIView!
    @IBOutlet var viewINOX: UIView!
    let locationManager = CLLocationManager()
    struct City {
        var name: String
        var lattitude: CLLocationDegrees
        var longtitude: CLLocationDegrees
    }
    let city = [City(name: "Ba Dinh", lattitude: 21.033781, longtitude: 105.814054),
                City(name: "Cau Giay", lattitude: 21.036237, longtitude: 105.790583)]
    let distanceSpan: CLLocationDistance = 500000
    let locationLatLong = CLLocation(latitude: 21.033781, longitude: 105.814054)
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        let view = loadNib1()
        addSubview(view)
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        img.layer.cornerRadius = 30
        zoomlevel(location: locationLatLong)
        checkLocationServices()
        fetchStadiumsOnMap(city)
    }
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapkit.showsUserLocation = true
        case .denied: // Show alert telling users how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapkit.showsUserLocation = true
        case .restricted: // Show an alert letting them know what’s up
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }
    func zoomlevel(location: CLLocation){
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        mapkit.setRegion(mapCoordinates, animated: true)
    }
    func fetchStadiumsOnMap(_ citys: [City]) {
        for city in citys {
            let annotations = MKPointAnnotation()
            annotations.title = city.name
            annotations.coordinate = CLLocationCoordinate2D(latitude:
                city.lattitude, longitude: city.longtitude)
            mapkit.addAnnotation(annotations)
        }
    }
 

}
extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib1() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
