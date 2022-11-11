//
//  ViewController.swift
//  UILabel
//
//  Created by Eвгений Павлюков on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let myLAbel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 23)
        myLAbel.numberOfLines = 1
        myLAbel.frame = labelFrame
        
     
        
        myLAbel.text = "iOS 16 lalalalala"
        myLAbel.lineBreakMode = .byWordWrapping
        myLAbel.center = self.view.center
        myLAbel.sizeToFit()
        myLAbel.font = UIFont.boldSystemFont(ofSize: 20)
        myLAbel.textColor = UIColor.black
        myLAbel.shadowColor = UIColor.lightGray
        myLAbel.shadowOffset = CGSize(width: 3, height: 3)
        view.addSubview(myLAbel)
        
        
    }


}

