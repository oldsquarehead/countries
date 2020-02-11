//
//  ProvinceViewController.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import UIKit

class ProvinceViewController: UIViewController {

    fileprivate var labelText: String?

    fileprivate lazy var label: UILabel = {
        let label = UILabel()
        label.text = self.labelText
        label.sizeToFit()
        label.textColor = .white
        label.center = self.view.center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(self.label)
    }

}

extension ProvinceViewController {

    func showCountry(for country: Country) {
        self.labelText = country.Name
    }

}
