//
//  PopRestViewCell.swift
//  asum_deneme
//
//  Created by Selim Göktaş on 3.08.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit

class PopRestViewCell: UICollectionViewCell {
    
        @IBOutlet weak var PopRestImage: UIImageView!
        func setRestoran(r: PopRest) {
            PopRestImage.image = r.image
        }}
