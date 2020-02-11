//
//  MapView.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import UIKit
import MapKit
import EasyPeasy

class MapView: UIView {

    fileprivate lazy var map: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    init() {
        super.init(frame: .zero)
        self.layout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MapView {

    func center(on province: Province) {
        let request = MKLocalSearch.Request()

        // Use a basic combo of country code and province name
        request.naturalLanguageQuery = province.CountryCode + ", " + province.Name
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard error == nil, let response = response else { return }

            // Adjust display to the region to handle basic zoom/position
            self.map.setRegion(response.boundingRegion, animated: true)
        }
    }
    
}

fileprivate extension MapView {

    func layout() {
        self.addSubview(self.map)
        self.map.easy.layout(Edges(.zero))
    }

}
