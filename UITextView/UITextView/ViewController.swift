//
//  ViewController.swift
//  UITextView
//
//  Created by Eвгений Павлюков on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var myTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextView()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateFrameTextView(param:)), name: UIControl.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateFrameTextView(param:)), name: UIControl.keyboardWillHideNotification, object: nil)
        
        
    }

    func createTextView() {
        myTextView = UITextView(frame: CGRect(x: 20, y: 100, width: self.view.bounds.width - 50, height: self.view.bounds.height / 2)) // растягиваем изображение по экрану
        myTextView.text = "some text"
        myTextView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0) // это не связано с constrains
        myTextView.font = UIFont.systemFont(ofSize: 17)
        myTextView.backgroundColor = .lightGray
        self.view.addSubview(myTextView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myTextView.resignFirstResponder() // реагирует на нажатие экрана и убератет клавиатуру
        self.myTextView.backgroundColor = UIColor.white
    }
    
    
 //перересовываем textview когда поднимается клавиатура
    @objc func updateFrameTextView(param: Notification) {
        let userInfo = param.userInfo
        
        let keyboardRect = (userInfo![UIControl.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue //получаем координаты клавиатуры
        let keyboardFrame = self.view.convert(keyboardRect, to: view.window) //конвертируем эти координаты в CGRect формат
        
        if param.name == UIControl.keyboardWillHideNotification {
            myTextView.contentInset = UIEdgeInsets.zero //The custom distance that the content view is inset from the safe area or scroll view edges.
        } else {
            myTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            myTextView.scrollIndicatorInsets = myTextView.contentInset //The distance the scroll indicators are inset from the edge of the scroll view.
        }
        
        myTextView.scrollRangeToVisible(myTextView.selectedRange)
        
    }

}

