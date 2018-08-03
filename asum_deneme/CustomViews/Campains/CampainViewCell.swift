//
//  CampainViewCell.swift
//  asum_deneme
//
//  Created by Selim Göktaş on 3.08.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit

class CampainViewCell: UICollectionViewCell {
    
    @IBOutlet weak var CampainImage: UIImageView!
    func setCampain(r: Kampanya) {
        CampainImage.image = r.image
    }}
