//
//  SecondVC.swift
//  UINavigationController
//
//  Created by Eвгений Павлюков on 09.09.2022.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SecondVC"
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    @objc func goBack() {
//        self.navigationController?.popViewController(animated: true)
        //получаем текущий массив контроллеров
        var currentControllerArray = self.navigationController?.viewControllers
        
        
        // удаляем последний контроллер в массиве
        currentControllerArray?.removeLast()
        
        
        
        //присвоить наш результат
        
//        if let newController = currentControllerArray {
//            self.navigationController?.viewControllers = newController
//        } else {
//            print("иди нахуй")
//        }
        guard let newController = currentControllerArray else { return }
            self.navigationController?.viewControllers = newController
        }
        
    }

