//
//  Api.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import Foundation
import Alamofire

enum ApiCall: String {
    case
    country = "https://connect.mindbodyonline.com/rest/worldregions/country",
    province = "https://connect.mindbodyonline.com/rest/worldregions/country/{ID}/province"

    static let provinceIdReplacementVar = "{ID}"
}

class Api {

    class func getCountries(_ callback: @escaping ([Country]) -> Void) {
        AF.request(ApiCall.country.rawValue).responseDecodable(of: [Country].self) { response in
            if response.error != nil {
                callback([])
            } else {
                callback(response.value ?? [])
            }
        }
    }

    class func getProvinces(for id: Int, _ callback: @escaping ([Province]) -> Void) {
        let url = ApiCall.province.rawValue.replacingOccurrences(of: ApiCall.provinceIdReplacementVar, with: "\(id)")
        AF.request(url).responseDecodable(of: [Province].self) { response in
            if response.error != nil {
                callback([])
            } else {
                callback(response.value ?? [])
            }
        }
    }

}
