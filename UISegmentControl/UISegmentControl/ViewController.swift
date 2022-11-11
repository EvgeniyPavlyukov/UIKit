//
//  ViewController.swift
//  UISegmentControl
//
//  Created by Eвгений Павлюков on 08.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl = UISegmentedControl()
    var menuArray = ["one", "two", "three"] // сколько элементов в массиве столько он создаст переключателей
    
    var imageView = UIImageView()
    var imageArray = [UIImage(named: "diamond.png"),
                      UIImage(named: "coal.png"),
                      UIImage(named: "diamond@3x.png")]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //image
        self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(self.imageView)
        
        
        // create segment
        self.segmentControl = UISegmentedControl(items: self.menuArray)
        self.segmentControl.frame = CGRect(x: 100, y: 600, width: 200, height: 30)
        self.view.addSubview(self.segmentControl)
        
        self.segmentControl.addTarget(self, action: #selector(selectedValue(target:)), for: .valueChanged)
        
    }

    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imageArray[segmentIndex]
            
            
            let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }

}

