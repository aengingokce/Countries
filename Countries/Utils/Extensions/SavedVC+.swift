//
//  SavedVC+.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

extension SavedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let savedCell = savedTableView.dequeueReusableCell(withIdentifier: "SavedCell") as? SavedCell else { return UITableViewCell() }
        savedCell.lblSavedCountryName.text = "Test"
        return savedCell
    }
    
    
}
