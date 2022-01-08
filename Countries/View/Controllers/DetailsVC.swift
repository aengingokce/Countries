//
//  DetailsVC.swift
//  Countries
//
//  Created by Ahmet Engin Gökçe on 8.01.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import WebKit

class DetailsVC: UIViewController {

    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var imgCountryFlag: UIImageView!
    @IBOutlet weak var btnSaved: UIButton!
    
    var code: String?
    var wikiDataId: String?
    var name: String?
    
    var parser = ParserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let code = code {
            lblCode.text = code
            getCountryDetails(countryCode: code, host: host, key: key, url: "\(uri)/\(code)")
        }
        
        if let name = name {
            title = name
            if UserDefaultService.name.contains(name) {
                btnSaved.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
            } else {
                btnSaved.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
            }
        }
        btnInfo.layer.cornerRadius = 5
    }
    
    @IBAction func btnInfoTapped(_ sender: UIButton) {
        if let wikiDataId = wikiDataId {
            let wikiDataIdUri = "https://www.wikidata.org/wiki/\(wikiDataId)"
            if let detailUrl = URL(string: wikiDataIdUri) {
                UIApplication.shared.open(detailUrl)
            }
        }
    }
    
    @IBAction func btnSavedTapped(_ sender: UIButton) {
        
        if btnSaved.currentImage == UIImage(systemName: "star") {
            btnSaved.setImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
            UserDefaultService.name.append(name!)
            UserDefaultService.code.append(code!)
        } else {
            btnSaved.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
            if let index = UserDefaultService.name.firstIndex(of: name!) {
                UserDefaultService.name.remove(at: index)
                UserDefaultService.code.remove(at: index)
            }
        }
        UserDefaults.standard.removeObject(forKey: "savedCountriesName")
        UserDefaults.standard.removeObject(forKey: "savedCountriesCode")
        UserDefaults.standard.synchronize()
        UserDefaults.standard.set(UserDefaultService.name, forKey: "savedCountriesName")
        UserDefaults.standard.set(UserDefaultService.code, forKey: "savedCountriesCode")
        UserDefaults.standard.synchronize()
    }
    
    
    @IBAction func btnBackTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func getCountryDetails(countryCode: String, host: String, key: String, url: String) {
        if countryCode != "" {
            let headers: HTTPHeaders = [
                "x-rapidapi-host": host,
                "x-rapidapi-key": key,
            ]

            AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { details in
                switch details.result {
                case let .success(value):
                    let detailsJson = JSON(value)
                    print("burada")
                    print(detailsJson)
                    let dic = detailsJson.dictionary
                    if dic?["data"] != nil {
                        self.wikiDataId = dic?["data"]?["wikiDataId"].stringValue
                        let flagImageUri = dic?["data"]?["flagImageUri"].stringValue
                        if let flagImageUri = flagImageUri {
                            var svgUrl: URL {
                                let flagImageUri = flagImageUri
                                return URL(string: flagImageUri)!
                            }
                            let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.imgCountryFlag.frame.width, height: self.imgCountryFlag.frame.height))
                            let request = URLRequest(url: svgUrl)
                            webView.load(request)
                            self.imgCountryFlag.addSubview(webView)
                        }
                    }
                case let .failure(err):
                    print(err.localizedDescription)
                }
            }
        }
    }
    
}
