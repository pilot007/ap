//
//  sideMenuVCViewController.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 23.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit

class sideMenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var sideMenuTable: UITableView!
    var TableArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableArray = ["Anasayfa","Profilim","Restoranlar","Kampanyalar","Favorilerim","Yardım","Ayarlar","Çıkış"]
        
        profileImage.image = UIImage(named: "SideMenuIcons/profileImage")
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        sideMenuTable.delegate = self
        sideMenuTable.dataSource = self
        sideMenuTable.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for:indexPath) as! MenuCell
        
        cell.menu_icon?.image = UIImage(named: "SideMenuIcons/\(TableArray[indexPath.row])")
        cell.menu_title?.text = TableArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: TableArray[indexPath.row], sender: self)
    }
    
}
