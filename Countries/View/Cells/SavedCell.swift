//
//  SavedCell.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

class SavedCell: UITableViewCell {

    @IBOutlet weak var btnSaved: UIButton!
    @IBOutlet weak var lblSavedCountryName: UILabel!
    
    var actionSave: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func btnSavedTapped(_ sender: Any) {
        actionSave?()
    }
    
}
