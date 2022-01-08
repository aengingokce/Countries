//
//  CountryCodeViewModel.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

struct CountryCodeListViewModel {
    let countryCodeList: [CountryCode]
    
    func numberOfRowsInSection() -> Int {
        return self.countryCodeList.count
    }
    
    func codeAtIndex(_ index: Int) -> CountryCodeViewModel {
        let countryCode = self.countryCodeList[index]
        return CountryCodeViewModel(countryCode)
    }
}

struct CountryCodeViewModel {
    let countryCode: CountryCode
    
    init(_ countryCode: CountryCode) {
        self.countryCode = countryCode
    }
    
    var countryCodes: String {
        return self.countryCode.code
    }
}


