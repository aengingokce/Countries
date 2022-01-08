//
//  HomeVC.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class HomeVC: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
//    var countryNameListViewModel: CountryNameListViewModel!
//    var countryCodeListViewModel: CountryCodeListViewModel!
    
    var savedCountries = [String]()
    var parser = ParserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        parser.getCountries(host: host, key: key, url: "\(uri)\(limit)")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.homeTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        savedCountries.removeAll(keepingCapacity: false)
        savedCountries = UserDefaults.standard.stringArray(forKey: "savedCountriesName") ?? [String]()
        homeTableView.reloadData()
    }
}
