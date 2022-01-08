//
//  CountryNameViewModel.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

struct CountryNameListViewModel {
    let countryNameList: [CountryName]
    
    func numberOfRowsInSection() -> Int {
        return self.countryNameList.count
    }
    
    func countryAtIndex(_ index: Int) -> CountryNameViewModel {
        let countryName = self.countryNameList[index]
        return CountryNameViewModel(countryName)
    }
}

struct CountryNameViewModel {
    let countryName: CountryName
    
    init(_ countryName: CountryName) {
        self.countryName = countryName
    }
    
    var countryNames: String {
        return self.countryName.name
    }

}
