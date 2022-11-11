//
//  ViewController.swift
//  UINavigationViewController part2
//
//  Created by Eвгений Павлюков on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createImageTitleView()
        
        // CAMERA
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action:#selector(perfAdd(param:)))
        
        // SEGMENTController insted of camera
        
        
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        imageView1.contentMode = .scaleAspectFit
        imageView2.contentMode = .scaleAspectFit
        
        let image1 = UIImage(named: "MeAvatar")
        let image2 = UIImage(named: "YouAvatar")
        imageView1.image = image1
        imageView2.image = image2
        let itemsSegment = [image1, image2]
       
        
        
        let segmentController = UISegmentedControl(items: itemsSegment as [Any])
       
        imageView1.contentMode = .scaleAspectFit
        imageView2.contentMode = .scaleAspectFit
        segmentController.isMomentary = true // чтобы подсвеченный выбор сбрасывался после нажатия
        segmentController.addTarget(self, action: #selector(segmentedControllTapped(param:)), for: .valueChanged)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentController)
        
        
        // SWITCH
        let switchButton = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        switchButton.isOn = true
        switchButton.addTarget(self, action: #selector(perfSwitch(param:)), for: .valueChanged)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: switchButton) // customView позволяет добавить почти любой элемент
        
    }

    //MARK: - Methods
    
    fileprivate func createImageTitleView() {
        // как отобразить картинку
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit // contentmode помогает не растягивать изображение
        
        let image = UIImage(named: "MeAvatar")
        imageView.image = image
        
        self.navigationItem.titleView = imageView
    }
    
    //CAMERA
//    @objc func perfAdd(param: UIBarButtonItem) {
//        print("Add click")
//    }
//
    
    //SegmentedController
    @objc func segmentedControllTapped(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case 0:
            print("me")
        case 1:
            print("you")
        default:
            break
        }
    }
    
    // SWITCH
    @objc func perfSwitch(param: UISwitch) {
        if param.isOn {
            print("switch is on")
        } else {
            print("switch is off")
        }
    }

}

