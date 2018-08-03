//
//  _CampainVC.swift
//  asum_deneme
//
//  Created by Selim Göktaş on 3.08.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit
import Alamofire

class PopRestVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var arrayRest = [Restoran]()
    
    var messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPopulerRestoran()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getPopulerRestoran()
    {
        let baseUrl = "http://176.235.209.102/APMobilServices/api/mobil/GetPopulerRestoran?KisiId=1&Enlem=41.048579500000&boylam=28.996618500000"
        
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
                    let subeEnlem = json["SubeEnlem"].string
                    let subeBoylam = json["SubeBoylam"].string
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
                    
                    let r1 = Restoran(image: image!, title: subeAdi!, desc: mesafe!, adres: subeAdres!, telefon: subeTelefon!, calismaBaslangic: calismaBaslangic!,
                                      calismaBitis: calismaBitis!, restoranUrunleri: restoranUrunleriArray, subeEnlem: subeEnlem!, subeBoylam: subeBoylam! )
                    self.arrayRest.append(r1)
                }
                //print("refsh olacak")
                self.messageFrame.removeFromSuperview()
                self.tableView.reloadData()
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
        
        }
    
    //Servis yüklenirken loading gösterilmesi
    func progressBarDisplayer(msg:String, _ indicator:Bool ) {
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
        strLabel.text = msg
        strLabel.textColor = UIColor.white
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

extension PopRestVC {
    //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayRest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayRest.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,  cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let rest = arrayRest[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier : "popRestViewCell", for : indexPath) as! PopRestViewCell
        cell.setRestoran(r: rest)
        return cell
    }
}
