//
//  ArtworkMarkerView.swift
//  OnlyMaps
//
//  Created by Luiz on 8/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import MapKit

class ArtworkMakerView: MKMarkerAnnotationView {

    override var annotation: MKAnnotation? {
        willSet {
            guard let artwork = newValue as? Artwork else { return }
            // do the same thing as mapView(_:viewFor:), configuring the callout.
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            markerTintColor = artwork.makerTintColor
            //replace the pin icon (glyph) with the first letter of the annotation’s discipline
            glyphText = String(artwork.discipline.first!)

        }
    }
}
