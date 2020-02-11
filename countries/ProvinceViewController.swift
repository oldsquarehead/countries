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

    fileprivate weak var coordinator: AppCoordinator?

    init(with coordinator: AppCoordinator) {
        self.coordinator = coordinator

        super.init(nibName: nil, bundle: nil)
        self.coordinator?.setProvinceDelegate(self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(self.label)
    }

}

extension ProvinceViewController {

    func showCountry(for country: Country) {
        self.coordinator?.requestProvinces(for: country.ID)
    }

}

extension ProvinceViewController: AppCoordinatorProvinceDelegate {
    func provincesLoaded(provinces: [Province]) {
        print(provinces)
    }

    func startLoading() {

    }

    func endLoading() {

    }

    func error(error: NSError) {

    }
}
