//
//  HomeVC.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
    }

}
