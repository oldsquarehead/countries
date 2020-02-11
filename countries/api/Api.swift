//
//  Api.swift
//  countries
//
//  Created by Darren Sutherland on 2/10/20.
//  Copyright © 2020 Darren Sutherland. All rights reserved.
//

import Foundation
import Alamofire

enum ApiError {
    case
    timeout,
    other(String)

    var toString: String {
        switch self {
        case .timeout:
            return NSLocalizedString("The API call timed out", comment: "timeout error")
        case .other(let desc):
            return desc
        }
    }
}

enum ApiCall: String {
    case
    country = "https://connect.mindbodyonline.com/rest/worldregions/country",
    province = "https://connect.mindbodyonline.com/rest/worldregions/country/{ID}/province"

    static let provinceIdReplacementVar = "{ID}"
}

final class Api {

    class func getCountries(_ callback: @escaping ([Country], ApiError?) -> Void) {
        AF.request(ApiCall.country.rawValue).responseDecodable(of: [Country].self) { response in
            switch response.result {
            case .success(let countries):
                callback(countries, nil)
            case .failure(let error):
                if error.responseCode == NSURLErrorTimedOut {
                    callback([], .timeout)
                } else {
                    callback([], .other(error.localizedDescription))
                }
            }
        }
    }

    class func getProvinces(for id: Int, _ callback: @escaping ([Province], ApiError?) -> Void) {
        let url = ApiCall.province.rawValue.replacingOccurrences(of: ApiCall.provinceIdReplacementVar, with: "\(id)")
        AF.request(url).responseDecodable(of: [Province].self) { response in
            switch response.result {
            case .success(let provinces):
                callback(provinces, nil)
            case .failure(let error):
                if error.responseCode == NSURLErrorTimedOut {
                    callback([], .timeout)
                } else {
                    callback([], .other(error.localizedDescription))
                }
            }
        }
    }

}
