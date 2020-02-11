//
//  RootController.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import UIKit
import EasyPeasy

class RootController: UISplitViewController {

    fileprivate let loadingModal = LoadingModal()

    override func viewDidLoad() {
        self.delegate = self
        super.viewDidLoad()
    }

}

// MARK: UISplitViewControllerDelegate
extension RootController: UISplitViewControllerDelegate {

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }

}

extension RootController: AppCoordinatorDelegate {
    func startLoading() {
        self.view.addSubview(self.loadingModal)
        self.loadingModal.easy.layout(Center(), Width(100), Height(100))
    }

    func endLoading() {
        self.loadingModal.removeFromSuperview()
    }

    func error(error: NSError) {

    }

}
