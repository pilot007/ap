//
//  HomeControllerViewController.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 18.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit
import Alamofire

class HomeVC: BaseMenuController {
    @IBOutlet weak var firstScrollView: UIScrollView!
    @IBOutlet weak var popRestsScrollView: UIScrollView!
    @IBOutlet weak var nearRestScrollView: UIScrollView!
    
    @IBOutlet var openMenu: UIBarButtonItem!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    
    var messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstScrollView.showsHorizontalScrollIndicator = false
        getKampanyaGetir()
        
        popRestsScrollView.showsHorizontalScrollIndicator = false
        getPopulerRestoran()
        
        
        nearRestScrollView.showsVerticalScrollIndicator = false
        getRestoranGetir()
        
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

    func getPopulerRestoran()
    {
        let requestUrl = "http://176.235.209.102/APMobilServices/api/mobil/GetPopulerRestoran?KisiId=1&Enlem=41.048579500000&boylam=28.996618500000"
        
        
        Alamofire.request(requestUrl, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            if let result = response.result.value
            {
                let resultJson = result as! NSArray
                
                for(index, _) in resultJson.enumerated()
                {
                    let popRestoran = Restoran(object: resultJson[index] as! NSDictionary)
                    
                    let url = URL(string: popRestoran.LogoPath)!
                    let data = try? Data(contentsOf: url)
                    
                    if let PopRests = Bundle.main.loadNibNamed("PopRests", owner: self, options: nil)?.first as? PopRests{
                        PopRests.RestImage.image = UIImage(data: data!)
                        PopRests.RestName.text = popRestoran.SubeAdi
                        PopRests.frame.size.height = self.popRestsScrollView.bounds.size.height
                        PopRests.frame.size.width =  CGFloat(self.view.bounds.size.width) / 1.5
                        PopRests.frame.origin.x = (CGFloat(index) * self.view.bounds.size.width) + 30
                        PopRests.layer.masksToBounds = true
                        PopRests.layer.cornerRadius = 15.0
                        
                        self.popRestsScrollView.addSubview(PopRests)
                        
                    }
                }
                self.popRestsScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(resultJson.count), height: 100)
            }
        }
    }

    func getKampanyaGetir()
    {
        let requestUrl = "http://176.235.209.102/APMobilServices/api/Mobil/GetKampanyaGetir"
        var arrayOffer = [Kampanya]()
        
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
                    
                    let kampanya: Kampanya = Kampanya(image: nil!, KampanyaId: KampanyaId, KampanyaAdi: KampanyaAdi, KampanyaLogo: KampanyaLogo, KampanyaAciklama: KampanyaAciklama, KampanyaBaslangicTarihi:KampanyaBaslangicTarihi, KampanyaBitisTarihi: KampanyaBitisTarihi, Pasifmi: Pasifmi)
                    
                    let url = URL(string: kampanya.KampanyaLogo)!
                    let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch

                    
                    if let MainPageFirstSlider = Bundle.main.loadNibNamed("MainPageFirstSlider", owner: self, options: nil)?.first as? MainPageFirstSlider{
                        MainPageFirstSlider.mpSliderImage.image = UIImage(data: data!)
                        MainPageFirstSlider.mpSliderText.text = kampanya.KampanyaAciklama
                        MainPageFirstSlider.frame.size.height = self.firstScrollView.bounds.size.height
                        MainPageFirstSlider.frame.size.width = CGFloat(self.view.bounds.size.width) / 1.3
                        MainPageFirstSlider.frame.origin.x = (CGFloat(index) * self.view.bounds.size.width) + 20
                        
                        self.firstScrollView.addSubview(MainPageFirstSlider)
                    }
                    
                    arrayOffer.append(kampanya)
                }
                self.firstScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(arrayOffer.count), height: 100)
                
            }
            self.messageFrame.removeFromSuperview()
        }
    }

    func getRestoranGetir()
    {
        let requestUrl = "http://176.235.209.102/APMobilServices/api/Mobil/GetRestoranGetir?KisiId=1&Enlem=41.048579500000&boylam=28.996618500000"

        
        Alamofire.request(requestUrl, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON{ response in
            if let result = response.result.value
            {
                let resultJson = result as! NSArray
                
                for(index, _) in resultJson.enumerated()
                {
                    
                    let nearRestoran: Restoran = Restoran(object: resultJson[index] as! NSDictionary)
                    
                    let url = URL(string: nearRestoran.LogoPath)!
                    let data = try? Data(contentsOf: url)
                    
                    if let NearRests = Bundle.main.loadNibNamed("NearRests", owner: self, options: nil)?.first as? NearRests{
                        NearRests.restImage.image = UIImage(data: data!)
                        NearRests.restName.text = nearRestoran.SubeAdi
                        NearRests.restAdress.text = nearRestoran.Adress
                        NearRests.restDistance.text = nearRestoran.Mesafe
                        
                        NearRests.frame.size.height = CGFloat(UIScreen.main.bounds.height) * 0.1
                        NearRests.frame.size.width = CGFloat(self.nearRestScrollView.bounds.width) / 1.1
                        
                        NearRests.frame.origin.y = CGFloat(index) * (CGFloat(NearRests.frame.size.height) + 15)
                        NearRests.frame.origin.x = (UIScreen.main.bounds.width - NearRests.frame.size.width) / 2
                        
                        NearRests.layer.masksToBounds = true
                        NearRests.layer.cornerRadius = 15.0
                        
                        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
                        NearRests.addGestureRecognizer(gesture)
                        

                        
                        self.nearRestScrollView.addSubview(NearRests)
                    }
                }
                self.nearRestScrollView.contentSize = CGSize(width: self.view.bounds.width, height: (CGFloat(UIScreen.main.bounds.height + 15) * 0.1) * CGFloat(resultJson.count))
            }
        }
    }

    @objc func checkAction(sender : UITapGestureRecognizer) {
        performSegue(withIdentifier: "Home2RestDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Master2Detail"
        {
            let destVC = segue.destination as! RestDetailVC
            //destVC.rest = sender as? Restoran
        }
    }
}

