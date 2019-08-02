//
//  ViewController.swift
//  OnlyMaps
//
//  Created by Luiz on 8/2/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit

import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    let myLocation = CLLocationCoordinate2D(latitude: 43.78513042074207, longitude: -79.4240542273944)
    let location = CLLocation(latitude: 21.282778, longitude: -157.829444)
    let regionRadius : CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        centerMap(location: location)
        showArtwork()
        mapView.delegate = self
    }

    func centerMap(location: CLLocation)  {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func showArtwork() {
        // show artwork on map
        let artwork = Artwork(title: "King David Kalakaua",
                              locationName: "Waikiki Gateway Park",
                              discipline: "Sculpture",
                              coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        mapView.addAnnotation(artwork)
    }
}

extension ViewController: MKMapViewDelegate {

    //Return a view for each annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Artwork else { return nil }
        let identifier = "marker"
        var annotationView : MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            annotationView = dequeuedView
        } else {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.canShowCallout = true
            annotationView.calloutOffset = CGPoint(x: -5, y: 5)
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

        }

        return annotationView
    }
}

