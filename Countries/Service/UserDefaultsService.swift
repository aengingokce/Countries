//
//  UserDefaultsService.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import Foundation

class UserDefaultService {
    static var name = [String]()
    static var code = [String]()

    class func userDefaults() {
        UserDefaults.standard.removeObject(forKey: "savedCountriesName")
        UserDefaults.standard.removeObject(forKey: "savedCountriesCode")
        UserDefaults.standard.set(UserDefaultService.name, forKey: "savedCountriesName")
        UserDefaults.standard.set(UserDefaultService.code, forKey: "savedCountriesCode")
        UserDefaults.standard.synchronize()
    }
}
