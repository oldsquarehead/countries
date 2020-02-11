//
//  CountriesTableViewController.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    fileprivate let coordinator: AppCoordinator

    init(with coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(style: .plain)
        self.coordinator.setCountryDelegate(self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static let reuseIdentifier = "CountryCell"

    fileprivate var countryList: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: CountriesTableViewController.reuseIdentifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewController.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = self.countryList[indexPath.row].Name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let provinceVc = ProvinceViewController(with: self.coordinator)
        provinceVc.showCountry(for: self.countryList[indexPath.row])

        let nc = UINavigationController()
        nc.viewControllers = [provinceVc]

        self.showDetailViewController(nc, sender: self)
    }
}

extension CountriesTableViewController: AppCoordinatorCountryDelegate {
    func countriesLoaded(countries: [Country]) {
        self.countryList = countries
        self.tableView.reloadData()
    }

    func startLoading() {

    }

    func endLoading() {

    }

    func error(error: NSError) {

    }
}
