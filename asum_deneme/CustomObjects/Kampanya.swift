//
//  Kampanya.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 31.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import Foundation
import UIKit

class Kampanya {
    var image: UIImage
    var KampanyaId: Int
    var KampanyaAdi: String
    var KampanyaLogo: String
    var KampanyaAciklama: String
    var KampanyaBaslangicTarihi: String
    var KampanyaBitisTarihi: String
    var Pasifmi: Int
    
    
    init(image : UIImage,KampanyaId: Int,KampanyaAdi: String,KampanyaLogo: String,KampanyaAciklama: String,KampanyaBaslangicTarihi: String,KampanyaBitisTarihi: String,Pasifmi: Int){
        self.KampanyaId = KampanyaId
        self.KampanyaAdi = KampanyaAdi
        self.KampanyaLogo = KampanyaLogo
        self.KampanyaAciklama = KampanyaAciklama
        self.KampanyaBaslangicTarihi = KampanyaBaslangicTarihi
        self.KampanyaBitisTarihi = KampanyaBitisTarihi
        self.Pasifmi = Pasifmi
        self.image = image
    }
    
}
