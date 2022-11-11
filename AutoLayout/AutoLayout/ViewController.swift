//
//  ViewController.swift
//  AutoLayout
//
//  Created by Eвгений Павлюков on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let view2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = UIColor.red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view1)
        view.addSubview(view2)
//        createView1Constraints()
//        createView2Constraints()
    }

    // так делать не надо. так работали очень давно есть еще VFL есть еще NSLayoutAnchor
    
//    func createView1Constraints() {
//        NSLayoutConstraint(item: view1,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerX,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: view1,
//                           attribute: .centerY,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerY,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: view1,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 200).isActive = true
//        NSLayoutConstraint(item: view1,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 200).isActive = true
//    }
//
//    func createView2Constraints() {
//        NSLayoutConstraint(item: view2,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: view1,
//                           attribute: .centerX,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: view2,
//                           attribute: .bottom,
//                           relatedBy: .equal,
//                           toItem: view1,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: -8).isActive = true
//        NSLayoutConstraint(item: view2,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 100).isActive = true
//        NSLayoutConstraint(item: view2,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 100).isActive = true
//    }

}

