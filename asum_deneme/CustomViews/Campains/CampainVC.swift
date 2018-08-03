//
//  _CampainVC.swift
//  asum_deneme
//
//  Created by Selim Göktaş on 3.08.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CampainVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
   
    @IBOutlet weak var collectionView: UICollectionView!
    

    var arrayOffer = [Kampanya]()

    var messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getKampanyaGetir()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    
    func getKampanyaGetir()
    {
        let requestUrl = "http://176.235.209.102/APMobilServices/api/Mobil/GetKampanyaGetir"
        
        var KampanyaId : Int = 0
        var KampanyaAdi : String = ""
        var KampanyaLogo : String = ""
        var KampanyaAciklama : String = ""
        var KampanyaBaslangicTarihi : String = ""
        var KampanyaBitisTarihi : String = ""
        var Pasifmi : Int = 0
        
        progressBarDisplayer(msg:"Yükleniyor",true)
        
        Alamofire.request(requestUrl, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            if let result = response.result.value
            {
                let resultJson = result as! NSArray
                
                for (index, _) in resultJson.enumerated()
                {
                    let resultObject = resultJson[index] as! NSDictionary
                    KampanyaId = resultObject["KampanyaId"] as! Int
                    KampanyaAdi = resultObject["KampanyaAdi"] as! String
                    KampanyaLogo = resultObject["LogoPath"] as! String
                    KampanyaAciklama = resultObject["KampanyaAciklama"] as! String
                    KampanyaBaslangicTarihi = resultObject["KampanyaBaslangicTarihi"] as! String
                    KampanyaBitisTarihi = resultObject["KampanyaBitisTarihi"] as! String
                    Pasifmi = resultObject["Pasifmi"] as! Int
                    
                    let imageUrl = URL(string: KampanyaLogo)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let image = UIImage(data: imageData)
                    
                    let kampanya: Kampanya = Kampanya(image: image!, KampanyaId: KampanyaId, KampanyaAdi: KampanyaAdi, KampanyaLogo: KampanyaLogo, KampanyaAciklama: KampanyaAciklama, KampanyaBaslangicTarihi:KampanyaBaslangicTarihi, KampanyaBitisTarihi: KampanyaBitisTarihi, Pasifmi: Pasifmi)
                    
                    let url = URL(string: kampanya.KampanyaLogo)!
                    let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    
                    
                    self.arrayOffer.append(kampanya)

                    }
                self.collectionView.reloadData()
                self.messageFrame.removeFromSuperview()

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

extension CampainVC {
    //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayOffer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOffer.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,  cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let campain = arrayOffer[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier : "CampainViewCell", for : indexPath) as! CampainViewCell
        cell.setCampain(r: campain)
        return cell
    }
}
