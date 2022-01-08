//
//  HomeVC.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

import Alamofire
import SwiftyJSON

class HomeVC: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var countryNameListViewModel: CountryNameListViewModel!
    var parser = ParserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        parser.getCountriesName(host: host, key: key, url: "\(uri)\(limit)") { data in
            self.countryNameListViewModel = CountryNameListViewModel(countryNameList: data)
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }

}
