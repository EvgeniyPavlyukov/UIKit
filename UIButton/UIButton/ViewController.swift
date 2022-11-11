//
//  ViewController.swift
//  UIButton
//
//  Created by Eвгений Павлюков on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var myButton = UIButton()
    let image = UIImage(named: "dice1")
    let highlightedImage = UIImage(named: "dice2")

    
    // тени и закругления замедляют копрьютер надо быть аккуратнее
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        myButton.setTitle("press me", for: .normal)
        myButton.setTitle("I am pressed", for: .highlighted)
        myButton.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchUpInside)
        
        
        myButton.setImage(image, for: .normal)
        myButton.setImage(highlightedImage, for: .highlighted)
        
        self.view.addSubview(myButton)
        
    }

    @objc func buttonIsPressed(sender: UIButton) {
        print("Button is pressed")
    }
    
    @objc func buttonIsTapped(sender: UIButton) {
        print("Button is tapped")
    }

}

