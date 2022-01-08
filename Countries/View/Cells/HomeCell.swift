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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnSavedTapped(_ sender: UIButton) {
    }
    
}
