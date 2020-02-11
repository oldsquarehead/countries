//
//  ProvinceViewController.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import UIKit
import EasyPeasy
import MapKit

class ProvinceViewController: UIViewController {

    static let reuseIdentifier = "ProvinceCell"

    // Static map to avoid repainting
    fileprivate static let map = MapView()

    fileprivate var provinceList: [Province] = []

    // Basic table view for showing province spi results
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ProvinceViewController.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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

        // Annotate the header
        self.navigationItem.title = NSLocalizedString("Provinces", comment: "Header display title for province VC")

        self.layout()
    }
}

fileprivate extension ProvinceViewController {

    func layout() {
        self.view.addSubview(self.tableView)
        self.tableView.easy.layout(
            Height(*0.5).like(self.view),
            Width().like(self.view),
            Bottom().to(self.view, .bottom)
        )

        self.view.addSubview(ProvinceViewController.map)
        ProvinceViewController.map.easy.layout(
            Height(*0.5).like(self.view),
            Width().like(self.view),
            Top().to(self.view, .top)
        )
    }
}

extension ProvinceViewController {

    func showCountry(for country: Country) {
        self.coordinator?.requestProvinces(for: country.ID)
    }

}

extension ProvinceViewController: AppCoordinatorProvinceDelegate {
    func provincesLoaded(provinces: [Province]) {
        self.provinceList = provinces
        self.tableView.reloadData()
    }

    func startLoading() {

    }

    func endLoading() {

    }

    func error(error: NSError) {

    }
}

extension ProvinceViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ProvinceViewController.map.center(on: self.provinceList[indexPath.row])
    }

}

extension ProvinceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.provinceList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProvinceViewController.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = self.provinceList[indexPath.row].Name
        return cell
    }

}
