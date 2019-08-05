//
//  Artwork.swift
//  OnlyMaps
//
//  Created by Luiz on 8/2/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import MapKit
import Contacts
class Artwork: NSObject, MKAnnotation {

    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return locationName
    }

    var makerTintColor: UIColor {
        switch discipline {
        case "Monument":
            return .red
        case "Mural":
            return .cyan
        case "Plaque":
            return .blue
        case "Sculpture":
            return .purple
        default:
            return .green
        }
    }

    var imageName: String? {
        if discipline == "Sculpture" { return "Statue"}
        return "Flag"
    }
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {

        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        super.init()
    }

    init?(json: [Any]) {
        self.title = json[16] as? String ?? "No Title"
        self.locationName = json[12] as! String
        self.discipline = json[15] as! String

        if let lat = Double(json[18] as! String), let long = Double(json[19] as! String) {
            self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
    }

    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey : subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
