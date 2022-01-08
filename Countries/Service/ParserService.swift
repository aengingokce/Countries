//
//  ParserService.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import WebKit

class ParserService {
    var name = [String]()
    var code = [String]()
    
    //public init() {}
    
    public func getCountries(host: String, key: String, url: String) {
        let headers: HTTPHeaders = [
            "x-rapidapi-host": host,
            "x-rapidapi-key": key,
        ]
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { countries in
            switch countries.result {
            case let .success(value):
                self.name.removeAll(keepingCapacity: false)
                self.code.removeAll(keepingCapacity: false)
                let countriesJson = JSON(value)
                if countriesJson.dictionary?["data"] != nil {
                    let countriesArray = JSON(countriesJson.dictionary?["data"]! as Any)
                    for country in countriesArray.array! {
                        self.name.append(country["name"].stringValue)
                        self.code.append(country["code"].stringValue)
                    }
                }
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
    }
    

}
