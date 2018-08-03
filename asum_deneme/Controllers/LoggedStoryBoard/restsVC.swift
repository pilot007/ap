//
//  restsVC.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 24.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class restsVC: BaseMenuController {

    @IBOutlet weak var tableView: UITableView!
    
    var restorans: [RestoranS] = []
    var tempR: [RestoranS] = []
    var messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    
    let baseUrl = "http://176.235.209.102/APMobilServices/api/mobil/GetRestoranGetir?KisiId=1&Enlem=41.048579500000&boylam=28.996618500000"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restorans = createArray()
        
        setupNavBar()
    }
    
    func setupNavBar() {
        let searchController = UISearchController(searchResultsController: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Master2Detail"
        {
            let destVC = segue.destination as! RestDetailVC
            destVC.rest = sender as? RestoranS
        }
    }
    func createArray() -> [RestoranS] {
        progressBarDisplayer(msg:"Lütfen Bekleyiniz",true)
        Alamofire.request(baseUrl, method: .get).responseJSON { response in
            if response.result.isSuccess {
                let jsonData : JSON = JSON(response.result.value!)
                
                for json in jsonData.arrayValue {
                    let mesafe = json["Mesafe"].string
                    let restoranLogoYolu = json["LogoPath"].string
                    let subeAdi = json["SubeAdi"].string
                    let restoranUrunleri = json["RestoranUrunleri"].string
                    let subeAdres = json["Adress"].string
                    let subeTelefon = json["Telefon"].string
                    let calismaBaslangic = json["CalismaZamaniBaslangic"].string
                    let calismaBitis = json["CalismaZamaniBitis"].string
                    
                    var restoranUrunleriArray = [String]()
                    
                    let result = restoranUrunleri?.split(separator: ",")
                    
                    for restoranUrun in result!{
                        //Array burada dolduruluyor
                        restoranUrunleriArray.append(String(restoranUrun))
                    }
                    print(restoranUrunleriArray)
                    
                    let imageUrl = URL(string: restoranLogoYolu!)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let image = UIImage(data: imageData)
                    
                    let r1 = RestoranS(image: image!, title: subeAdi!, desc: mesafe!, adres: subeAdres!, telefon: subeTelefon!, calismaBaslangic: calismaBaslangic!, calismaBitis: calismaBitis!, restoranUrunleri: restoranUrunleriArray )
                    self.tempR.append(r1)
                }
                //print("refsh olacak")
                self.messageFrame.removeFromSuperview()
                self.tableView.reloadData()
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
        return tempR
    }
    
    func progressBarDisplayer(msg:String, _ indicator:Bool ) {
        print(msg)
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
        strLabel.text = msg
        //strLabel.textColor = UIColor.whiteColor()
        messageFrame = UIView(frame: CGRect(x: view.frame.midX - 90, y: view.frame.midY - 25 , width: 180, height: 50))
        messageFrame.layer.cornerRadius = 15
        messageFrame.backgroundColor = UIColor(white: 0, alpha: 0.7)
        if indicator {
            activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.startAnimating()
            messageFrame.addSubview(activityIndicator)
        }
        messageFrame.addSubview(strLabel)
        view.addSubview(messageFrame)
    }
}

extension restsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempR.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let restoran = tempR[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestoranCell") as! RestoranCell
        
        cell.setRestoran(r: restoran)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rest = tempR[indexPath.row]
        performSegue(withIdentifier: "Master2Detail", sender: rest)
    }
}
