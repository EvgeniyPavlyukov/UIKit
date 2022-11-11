//
//  ViewController.swift
//  UISwitch
//
//  Created by Eвгений Павлюков on 08.09.2022.
//
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    let mySwitch = UISwitch()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        // Switch created
////        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
////        self.view.addSubview(self.mySwitch)
////
////        // Switch is on
////        self.mySwitch.setOn(true, animated: true)
////
////        // Check for working
////        if self.mySwitch.isOn {
////            print("on")
////        } else {
////            print("off")
////        }
////
////        self.mySwitch.addTarget(self, action: #selector(switchChanged(paramTarget:)), for: .valueChanged)
////
////    }
////
////    @objc func switchChanged(paramTarget: UISwitch) {
////        print("param is ", paramTarget)
////
////        if paramTarget.isOn {
////            print("on")
////        } else {
////            print("off")
////        }
////    }
//
//}

    
//MARK: - другой вариант исполнения отталкиваемся от центра
        
import UIKit

class ViewController: UIViewController {

    let mySwitch = UISwitch()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mySwitch.frame = CGRect.zero //нулевая точка
        self.mySwitch.center = self.view.center // у свича есть точка центра ее приравниваем к центру вью
        self.view.addSubview(self.mySwitch) // делаем так чтобы отображалось на экране
        // off color
        self.mySwitch.tintColor = UIColor.green
        // рычажок цвет
        self.mySwitch.thumbTintColor = UIColor.red
        //on color
        self.mySwitch.onTintColor = UIColor.blue
        
        // кнопка
        self.button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.button.backgroundColor = UIColor.orange
        self.button.setTitle("OK", for: .normal)
        self.button.setTitle("Button is on", for: .highlighted)
        
        self.view.addSubview(self.button)
        
        self.mySwitch.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
    }
    
    // отключается доступ к кнопке если свитч on
    @objc func isOn(target: UISwitch) {
        if target.isOn {
            self.button.isUserInteractionEnabled = false
        } else {
            self.button.isUserInteractionEnabled = true
        }
    }
}


