//
//  ViewController.swift
//  asum_deneme
//
//  Created by Oğuzhan Yapıcı on 2.07.2018.
//  Copyright © 2018 Oğuzhan Yapıcı. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    
    @IBOutlet weak var sliderScrollView: UIScrollView!
    @IBOutlet weak var btnWelcomeLogin: UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    
    let welcome1 = ["image":"welcome_image", "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."]
    let welcome2 = ["image":"welcome_image", "text": "slider2"]
    let welcome3 = ["image":"welcome_image", "text": "slider3"]
    let welcome4 = ["image":"welcome_image", "text": "slider4"]
    let welcome5 = ["image":"welcome_image", "text": "slider5"]
    
    var welcomeArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        btnWelcomeLogin.layer.cornerRadius = 25
        UIApplication.shared.statusBarStyle = .default
        
        welcomeArray = [welcome1,welcome2,welcome3,welcome4,welcome5]
        sliderScrollView.isPagingEnabled = true
        sliderScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(welcomeArray.count), height: 300)
        sliderScrollView.showsHorizontalScrollIndicator = false
        sliderScrollView.delegate = self
        pageController.numberOfPages = welcomeArray.count
        loadSlider()
        
    }
    
    func loadSlider(){
        for (index, welcome) in welcomeArray.enumerated(){
            if let WelcomeView = Bundle.main.loadNibNamed("WelcomeSlider", owner: self, options: nil)?.first as? WelcomeSlider{
                WelcomeView.sliderImage.image = UIImage(named: welcome["image"]!)
                WelcomeView.sliderText.text = welcome["text"]
                WelcomeView.frame.size.height = sliderScrollView.bounds.size.height
                WelcomeView.frame.size.width = self.view.bounds.size.width
                WelcomeView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                sliderScrollView.addSubview(WelcomeView)

                
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(page)
    }

    


    
}

