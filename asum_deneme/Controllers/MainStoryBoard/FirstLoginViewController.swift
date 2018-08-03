//
//  FirstLoginViewController.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 10.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit
import Alamofire
import Toast_Swift

class FirstLoginViewController: UIViewController {
    @IBOutlet weak var loginUserName: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSingUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        
        setProps(textField: loginUserName)
        setProps(textField: loginPassword)
        btnLogin.layer.cornerRadius = 25.0
        btnSingUp.layer.cornerRadius = 25.0
    }
    
    func setProps (textField : UITextField){
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 25.0
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
        
        let userNameTxt = loginUserName.text
        let passwordTxt = loginPassword.text
        login(userName: userNameTxt!, password: passwordTxt!)
    }
    
    
    func login (userName : String, password : String)
    {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Logged", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "rwController")
        //self.present(newViewController, animated: true, completion: nil)
        self.present(newViewController, animated:true, completion:nil)
        //self.navigationController?.pushViewController(newViewController, animated: true)
//
//        let parameters: Parameters = [
//            "username": userName,
//            "password": password
//        ]
//
//
//        Alamofire.request("http://its.yaz.com.tr/APMobilServices/api/Mobil/GetMobilLogin", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//            .responseJSON { response in
//                //to get JSON return value
//                if let result = response.result.value {
//                    let JSON = result as! NSDictionary
//
//                    if JSON["mobilLogin"] is NSNull
//                    {
//                        self.view.makeToast("Kullanıcı adı veya şifre yanlış!")
//                    }else
//                    {
//                        let loginObject = JSON["mobilLogin"] as! NSDictionary
//                        let name = loginObject["UserName"]
//                        print(name!)
//
//                        let preferences = UserDefaults.standard
//
//                        let storyBoard: UIStoryboard = UIStoryboard(name: "Logged", bundle: nil)
//                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loggedNavController")
//                        //self.present(newViewController, animated: true, completion: nil)
//                        self.present(newViewController, animated:true, completion:nil)
//                        //self.navigationController?.pushViewController(newViewController, animated: true)
//
//                        for(key,value) in loginObject
//                        {
//                            if value == nil
//                            {
//                                preferences.set(value, forKey: key as! String)
//                            }else
//                            {
//                                preferences.set("", forKey: key as! String)
//                            }
//                        }
//
//                        let namer = UserDefaults.standard.string(forKey: "userName") ?? "BOI"
//                        print(namer)
//                    }
//                }
//        }
        
    }
    
    
}


