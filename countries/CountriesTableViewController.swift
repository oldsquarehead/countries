//
//  CountriesTableViewController.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

    static let reuseIdentifier = "CountryCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: CountriesTableViewController.reuseIdentifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Country.testCountries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewController.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = Country.testCountries[indexPath.row].Name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let provinceVc = ProvinceViewController()
        provinceVc.showCountry(for: Country.testCountries[indexPath.row])

        let nc = UINavigationController()
        nc.viewControllers = [provinceVc]

        self.showDetailViewController(nc, sender: self)
    }
}
