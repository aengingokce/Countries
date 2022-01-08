//
//  SavedVC.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

class SavedVC: UIViewController {

    @IBOutlet weak var savedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedTableView.delegate = self
        savedTableView.dataSource = self

    }

}
