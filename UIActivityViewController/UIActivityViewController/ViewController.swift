//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by Eвгений Павлюков on 08.09.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self
        self.createdTextField()
        self.createButton()
       
        
    }

//MARK: - Method
    func createdTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center // self значит в этом контроллере если забыть селф то непонятно куда я обращаюсь можно селф заменить на делегат
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter Text to share"
        self.view.addSubview(textField)
    }
    
    func createButton() {
        self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 50, y: 350, width: 200, height: 44)
        self.buttonShare.setTitle("Share", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(handleShare(parameterSender:)), for: .touchUpInside)
        self.view.addSubview(buttonShare)
    }
    
    @objc func handleShare(parameterSender: Any) {
        let text = self.textField.text
        
        if text?.count == 0 {
            let message = "Type something first, then press the button"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(action)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        
            /* The system provides several standard services, such as copying items to the pasteboard, posting content to social media sites, sending items via email or SMS, and more. Apps can also define custom services.
             Your app is responsible for configuring, presenting, and dismissing this view controller. Configuration for the view controller involves specifying the data objects on which the view controller should act. (You can also specify the list of custom services your app supports.) When presenting the view controller, you must do so using the appropriate means for the current device. On iPad, you must present the view controller in a popover. On iPhone and iPod touch, you must present it modally.
             */
        
        self.present(self.activityViewController!, animated: true, completion: nil)
        
    }
    
    
    //MARK: - textFieldDelegate
    
    
    
    
}

