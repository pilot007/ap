//
//  BaseMenuController.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 24.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit

class BaseMenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.barTintColor = UIColor(named: "navbar_color")
        let color = UIColor.white
        let font = UIFont(name: "VarelaRound-Regular", size: 22)!
        
        let attrs: [NSAttributedStringKey: AnyObject] = [
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor: color
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        
        let str: String! = self.restorationIdentifier
        self.navigationItem.title = str
        
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburger"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "bookmark_nav"), style: .plain, target: "Any", action: Selector("Selector"))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }



}
