//
//  DrawerViewController.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 17.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var profileImage: UIImageView!
    var menuOptions = ["Anasayfa", "Profilim", "Restoranlar", "Kampanyalar", "Favorilerim", "Yardım", "Ayarlar", "Çıkış"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = 40
        profileImage.layer.borderColor = UIColor.blue.cgColor
        profileImage.layer.borderWidth = 2.0
        profileImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : Menu
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
    
