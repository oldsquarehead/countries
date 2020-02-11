//
//  Province.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import Foundation

struct Province: Decodable {
    let
    ID: Int,
    CountryCode: String,
    Code: String,
    Name: String

    static let testCountries: [Province] = [
        Province(ID: 97, CountryCode: "US", Code: "AL", Name: "Alabama"),
        Province(ID: 101,  CountryCode: "US", Code: "AK", Name: "Alaska")
    ]
}
