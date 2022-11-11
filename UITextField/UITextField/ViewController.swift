//
//  ViewController.swift
//  UITextField
//
//  Created by Eвгений Павлюков on 10.09.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var myTextField = UITextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // можно кликнуть на любую часть экрана и клавиатура спрячется
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        self.createTextField()
        
        myTextField.delegate = self
        
        self.myTextField.becomeFirstResponder() //клавиатура появляется при включении
        
        //клавиатура сдвигает frame при начале редактирования
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
            
        }
        
    

    
//MARK: - Create Text Field
    
    func createTextField() {
        let myTextFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        myTextField = UITextField(frame: myTextFieldFrame)
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        myTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        myTextField.textAlignment = .center
        myTextField.placeholder = "I am a developer mafaka"
        myTextField.center = self.view.center
        view.addSubview(self.myTextField)
    }
    
    
//MARK: - UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing = начинается редактирование")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField){
        print("textFieldDidBeginEditing = началось редактирование")
    }

    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       
        print("textFieldShouldEndEditing = заканчивается редактирование ")
    

        return true // если фолс то клавиатура не спрячется после отщелкивания на другую часть экрана
    }

    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing = закончилось редактирование ")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn = вы ввели \(string)")
        return true
    }

    
    func textFieldDidChangeSelection(_ textField: UITextField) {

    }

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear = ты что-то очистил")
        return true
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear = хотите убрать клавиатуру")
        if textField == myTextField {
            self.myTextField.resignFirstResponder()
        }
        return true
        
    }


    
    
    
}



    
