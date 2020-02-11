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

    func centerOn() {
        
    }
    
}

fileprivate extension MapView {

    func layout() {
        self.addSubview(self.map)
        self.map.easy.layout(Edges(.zero))
    }

}
