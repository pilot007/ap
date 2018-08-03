import Foundation
import UIKit

class RestoranS {
    
    var image: UIImage
    var title: String
    var desc: String
    var adres: String
    var telefon: String
    var calismaBaslangic: String
    var calismaBitis: String
    var restoranUrunleri = [String]()
    
    init(image: UIImage, title: String, desc: String, adres: String, telefon: String, calismaBaslangic: String, calismaBitis: String, restoranUrunleri: [String]) {
        self.image = image
        self.title = title
        self.desc = desc
        self.adres = adres
        self.telefon = telefon
        self.calismaBitis = calismaBitis
        self.calismaBaslangic = calismaBaslangic
        self.restoranUrunleri = restoranUrunleri
    }
}
