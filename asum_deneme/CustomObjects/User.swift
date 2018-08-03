//
//  User.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 27.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//
import Foundation
import UIKit

class User {
    
    var userName: String
    var name: String
    var tckn: String
    var token: String
    
    init(userName: String, name: String, tckn: String, token: String) {
        self.userName = userName
        self.name = name
        self.tckn = tckn
        self.token = token
    }
    
}
