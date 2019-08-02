//
//  Artwork.swift
//  OnlyMaps
//
//  Created by Luiz on 8/2/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import MapKit
class Artwork: NSObject, MKAnnotation {

    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return locationName
    }
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {

        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        super.init()
    }


}
