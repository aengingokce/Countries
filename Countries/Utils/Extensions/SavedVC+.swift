//
//  SavedVC+.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit

extension SavedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaultService.name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let savedCell = savedTableView.dequeueReusableCell(withIdentifier: "SavedCell") as? SavedCell else { return UITableViewCell() }
        savedCell.lblSavedCountryName.text = name[indexPath.row]
        savedCell.btnSaved.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
        savedCell.btnSaved.tag = indexPath.row
        savedCell.btnSaved.setTitle("", for: .normal)

        savedCell.actionSave = {
            savedCell.btnSaved.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
            DispatchQueue.main.async {
                self.removeUnsaved(section: indexPath.section, row: savedCell.btnSaved.tag)
            }
            if let index = UserDefaultService.name.firstIndex(of: self.name[indexPath.row]) {
                UserDefaultService.name.remove(at: index)
                UserDefaultService.code.remove(at: index)
                self.name.remove(at: index)
                self.code.remove(at: index)
            }
            UserDefaultService.userDefaults()
        }
        return savedCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        detailVC.code = code[indexPath.row]
        detailVC.name = name[indexPath.row]
        let navController = UINavigationController(rootViewController: detailVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
    
    func removeUnsaved(section: Int, row: Int) {
        savedTableView.beginUpdates()
        savedTableView.numberOfRows(inSection: section)
        savedTableView.deleteRows(at: [IndexPath(row: row, section: 0)], with: .fade)
        savedTableView.endUpdates()
        savedTableView.reloadData()
    }
}

