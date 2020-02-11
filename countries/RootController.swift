//
//  RootController.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import UIKit

class RootController: UISplitViewController {

    override func viewDidLoad() {
        self.delegate = self
        super.viewDidLoad()
        Api.getCountries { countries in
            debugPrint(countries)
        }

        Api.getProvinces(for: 227) { provinces in
            debugPrint(provinces)
        }
    }

}

// MARK: UISplitViewControllerDelegate
extension RootController: UISplitViewControllerDelegate {

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }

}
