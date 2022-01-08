//
//  ParserService.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class ParserService {
    
    var countryNames = [CountryName]()
    
    func getCountriesName(host: String, key: String, url: String, comp: @escaping ([CountryName]) -> ()) {
        let headers: HTTPHeaders = [
            "x-rapidapi-host": host,
            "x-rapidapi-key": key,
        ]
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let responseStr = response.value {
                let jSonResponse = JSON(responseStr)
                
                for (_,subJson):(String, JSON) in jSonResponse["data"] {
                    if let countryName = subJson["name"].string {
                        self.countryNames.append(CountryName(name: countryName))
                        comp(self.countryNames)
                    }
                }
            }
        }
    }
}
