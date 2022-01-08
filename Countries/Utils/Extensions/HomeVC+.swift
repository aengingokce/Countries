//
//  HomeVC+.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parser.name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let homeCell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else { return UITableViewCell() }
        
        homeCell.lblCountryName.text = parser.name[indexPath.row]
        
        if savedCountries.contains(parser.name[indexPath.row]) {
            homeCell.btnSaved.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            homeCell.btnSaved.setImage(UIImage(systemName: "star"), for: .normal)
        }

        homeCell.actionSave = {
            if homeCell.btnSaved.currentImage == UIImage(systemName: "star") {
                homeCell.btnSaved.setImage(UIImage(systemName: "star.fill"), for: .normal)
                UserDefaultService.name.append(self.parser.name[indexPath.row])
                UserDefaultService.code.append(self.parser.code[indexPath.row])
            } else {
                homeCell.btnSaved.setImage(UIImage(systemName: "star"), for: .normal)
                if let index = UserDefaultService.name.firstIndex(of: self.parser.name[indexPath.row]) {
                    UserDefaultService.name.remove(at: index)
                    UserDefaultService.code.remove(at: index)
                }
            }
            UserDefaultService.userDefaults()
        }
        return homeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        detailVC.code = parser.code[indexPath.row]
        detailVC.name = parser.name[indexPath.row]
        let navController = UINavigationController(rootViewController: detailVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
}
