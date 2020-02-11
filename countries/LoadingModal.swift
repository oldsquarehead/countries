//
//  LoadingModal.swift
//  countries
//
//  Created by Darren Sutherland on 2/11/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import UIKit
import EasyPeasy

final class LoadingModal: UIView {
    init() {
        super.init(frame: .zero)
        self.layout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        self.backgroundColor = .white

        // Decorate with curved border
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 6.0
        self.layer.borderWidth = 1.5

        // Add spinner to center
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.startAnimating()
        self.addSubview(spinner)
        spinner.easy.layout(Center())
    }
}
