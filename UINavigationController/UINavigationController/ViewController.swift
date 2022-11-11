//
//  ViewController.swift
//  UINavigationController
//
//  Created by Eвгений Павлюков on 09.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white
        
        self.button = UIButton(type: .system)
        self.button.setTitle("SecondVC", for: .normal)
        self.button.sizeToFit()
        self.button.center = self.view.center
        self.button.addTarget(self, action: #selector(performDisplaySecondVC(parametreCenter:)), for: .touchUpInside)
        
        self.view.addSubview(self.button)
    }

    @objc func performDisplaySecondVC(parametreCenter: Any) {
        let secondVC = SecondVC()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

}

