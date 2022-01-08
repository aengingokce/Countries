//
//  HomeCell.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var btnSaved: UIButton!
    
    var actionSave: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func btnSavedTapped(_ sender: UIButton) {
        actionSave?()
    }
}
