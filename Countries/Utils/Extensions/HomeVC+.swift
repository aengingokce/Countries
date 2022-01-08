//
//  HomeVC+.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let homeCell = homeTableView.dequeueReusableCell(withIdentifier: "HomeCell") as? HomeCell else { return UITableViewCell() }
        homeCell.lblCountryName.text = "Test"
        return homeCell
    }
    
    
}
