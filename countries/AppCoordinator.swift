//
//  AppCoordinator.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import Foundation

protocol AppCoordinatorDelegate: class {
    func startLoading()
    func endLoading()
    func error(error: NSError)
}

protocol AppCoordinatorCountryDelegate: AppCoordinatorDelegate {
    func countriesLoaded(countries: [Country])
}

protocol AppCoordinatorProvinceDelegate: AppCoordinatorDelegate {
    func provincesLoaded(provinces: [Province])
}

final class AppCoordinator {

    private weak var countryDelegate: AppCoordinatorCountryDelegate?
    private weak var provinceDelegate: AppCoordinatorProvinceDelegate?

    func setCountryDelegate(_ delegate: AppCoordinatorCountryDelegate) {
        self.countryDelegate = delegate
    }

    func setProvinceDelegate(_ delegate: AppCoordinatorProvinceDelegate) {
        self.provinceDelegate = delegate
    }

    func requestCountries() {
        self.countryDelegate?.startLoading()
        Api.getCountries { [unowned self] countries in
            DispatchQueue.main.async {
                self.countryDelegate?.endLoading()
                self.countryDelegate?.countriesLoaded(countries: countries)
            }
        }
    }

    func requestProvinces(for id: Int) {
        self.provinceDelegate?.startLoading()
        Api.getProvinces(for: id) { [unowned self] provinces in
            DispatchQueue.main.async {
                self.provinceDelegate?.endLoading()
                self.provinceDelegate?.provincesLoaded(provinces: provinces)
            }
        }
    }

}
