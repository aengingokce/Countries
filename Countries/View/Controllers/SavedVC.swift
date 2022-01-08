//
//  SavedVC.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

class SavedVC: UIViewController {

    @IBOutlet weak var savedTableView: UITableView!
    
    var name = [String]()
    var code = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedTableView.delegate = self
        savedTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        name.removeAll(keepingCapacity: false)
        code.removeAll(keepingCapacity: false)
        if let savedCountriesName = UserDefaults.standard.stringArray(forKey: "savedCountriesName") {
            name = savedCountriesName
        }

        if let savedCountriesCode = UserDefaults.standard.stringArray(forKey: "savedCountriesCode") {
            code = savedCountriesCode
        }
        savedTableView.reloadData()
    }

}
