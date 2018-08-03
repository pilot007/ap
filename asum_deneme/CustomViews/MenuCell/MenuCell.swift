//
//  MenuCell.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 23.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var menu_icon: UIImageView?
    @IBOutlet weak var menu_title: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
}
