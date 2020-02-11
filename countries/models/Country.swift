//
//  Country.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import Foundation

public struct Country: Decodable {
    let
    ID: Int,
    Name: String,
    Code: String,
    PhoneCode: String?

    static let testCountries: [Country] = [
        Country(ID: 227, Name: "United States", Code: "US", PhoneCode: "1"),
        Country(ID: 4, Name: "Afghanistan", Code: "AF", PhoneCode: "93")
    ]
}


