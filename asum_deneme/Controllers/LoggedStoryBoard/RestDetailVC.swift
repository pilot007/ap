//
//  RestDetailVC.swift
//  asum_deneme
//
//  Created by Selim Göktaş on 1.08.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit

class RestDetailVC: UIViewController {
    
    @IBOutlet weak var RestoranImage: UIImageView!
    @IBOutlet weak var RestoranBaslik: UILabel!
    @IBOutlet weak var RestoranAdres: UILabel!
    @IBOutlet weak var RestoranTelefon: UILabel!
    @IBOutlet weak var RestoranCalismaSaatleri: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var rest: RestoranS?
    var collectionData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        title = rest?.title
        // Set up a 3-column Collection View
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width:width, height:width)
    }
    
    
    func setUI() {
        RestoranImage.image = rest?.image
        RestoranBaslik.text = rest?.title
        RestoranAdres.text = rest?.adres
        RestoranCalismaSaatleri.text = rest?.adres
        RestoranTelefon.text = rest?.telefon
//        let tutucu = "Çalışma Saatleri:\n Hafta İçi " + (rest?.calismaBaslangic)! + " - "  + (rest?.calismaBitis)!
//        RestoranCalismaSaatleri.text = tutucu
//        collectionData = rest!.restoranUrunleri
    }
    
}

extension RestDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        cell.contentView.layer.borderWidth=1.0
        if let label = cell.viewWithTag(100) as? UILabel
        {
            label.text = collectionData[indexPath.row]
        }
        return cell
    }
}
