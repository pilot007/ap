//
//  Restoran.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 1.08.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import Foundation
import UIKit

class Restoran {
    
    var SubeAdi : String
    var SubeId : String
    var SubeEnlem : String
    var SubeBoylam : String
    var KurumLogo : String
    var Mesafe : String
    var Telefon: String
    var CalismaZamaniBaslangic : String
    var CalismaZamaniBitis : String
    var ResmiTatilCalisma : String
    var CumartesiCalisma : String
    var PazarCalisma : String
    var Ilce : String
    var SubeMahalle : String
    var SubeSokak : String
    var SubeBinaNo : String
    var SubeKapiNo : String
    var Adress : String
    var RestoranUrunleri : String
    var FavoriRestorantMi : Int
    var LogoPath : String
    var image : UIImage
    
    public init(image : UIImage,SubeAdi : String, SubeId : String, SubeEnlem : String, SubeBoylam : String, KurumLogo : String, Mesafe : String, Telefon: String, CalismaZamaniBaslangic : String, CalismaZamaniBitis : String, ResmiTatilCalisma : String, CumartesiCalisma : String, PazarCalisma : String, Ilce : String, SubeMahalle : String, SubeSokak : String, SubeBinaNo : String, SubeKapiNo : String, Adress : String, RestoranUrunleri : String, FavoriRestorantMi : Int, LogoPath : String) {
        self.SubeAdi  = SubeAdi
        self.SubeId  = SubeId
        self.SubeEnlem  = SubeEnlem
        self.SubeBoylam  = SubeBoylam
        self.KurumLogo  = KurumLogo
        self.Mesafe  = Mesafe
        self.Telefon = Telefon
        self.CalismaZamaniBaslangic  = CalismaZamaniBaslangic
        self.CalismaZamaniBitis  = CalismaZamaniBitis
        self.ResmiTatilCalisma  = ResmiTatilCalisma
        self.CumartesiCalisma  = CumartesiCalisma
        self.PazarCalisma  = PazarCalisma
        self.Ilce  = Ilce
        self.SubeMahalle  = SubeMahalle
        self.SubeSokak  = SubeSokak
        self.SubeBinaNo  = SubeBinaNo
        self.SubeKapiNo  = SubeKapiNo
        self.Adress  = Adress
        self.RestoranUrunleri  = RestoranUrunleri
        self.FavoriRestorantMi  = FavoriRestorantMi
        self.LogoPath  = LogoPath
    }
    
    public init(object : NSDictionary)
    {
        SubeAdi = object["SubeAdi"] as! String
        SubeId = object["SubeId"] as! String
        SubeEnlem = object["SubeEnlem"] as! String
        SubeBoylam = object["SubeBoylam"] as! String
        KurumLogo = object["KurumLogo"] as! String
        Mesafe = object["Mesafe"] as! String
        Telefon = object["Telefon"] as! String
        CalismaZamaniBaslangic = object["CalismaZamaniBaslangic"] as! String
        CalismaZamaniBitis = object["CalismaZamaniBitis"] as! String
        ResmiTatilCalisma = object["ResmiTatilCalisma"] as! String
        CumartesiCalisma = object["CumartesiCalisma"] as! String
        PazarCalisma = object["PazarCalisma"] as! String
        Ilce = object["Ilce"] as! String
        SubeMahalle = object["SubeMahalle"] as! String
        SubeSokak = object["SubeSokak"] as! String
        SubeBinaNo = object["SubeBinaNo"] as! String
        SubeKapiNo = object["SubeKapiNo"] as! String
        Adress = object["Adress"] as! String
        RestoranUrunleri = object["RestoranUrunleri"] as! String
        FavoriRestorantMi = object["FavoriRestorantMi"] as! Int
        LogoPath = object["LogoPath"] as! String
    }
    

    
}
