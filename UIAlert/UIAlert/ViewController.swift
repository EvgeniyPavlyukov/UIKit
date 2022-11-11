//
//  ViewController.swift
//  UIAlert
//
//  Created by Eвгений Павлюков on 08.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func someButton(_ sender: Any) {
        
//        let alertController = UIAlertController(title: "Error!", message: "Ahtung!", preferredStyle: .alert) //preferredStyle: может быть .actionSheet
//        let action = UIAlertAction(title: "ok", style: .default) { (action) in
//            //это будет происходить когда будем нажимать на кнопку ОК
//            let text = alertController.textFields?.first?.text //  textField это массив
//            print(text ?? "nil text")
//        }
//
//        alertController.addTextField(configurationHandler: nil) //
//        alertController.addAction(action)
//        self.present(alertVontroller, animated: true, completion: nil)
        
        
        self.alert(title: "Внимание", message: "Введите пароль", style: .alert)
        self.hiLabel.text = "Hi,"
    }
    
    //2
    func alert(title: String, message: String, style: UIAlertController.Style) {
    
        let alertController = UIAlertController(title: title , message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in // этот код будет срабатывать когда жмется ОК
            let text = alertController.textFields?.first //почему это массив?? где остальные элементы этого массива ?
            self.hiLabel.text! += (text?.text!)! + ("!")
        }
        
        alertController.addTextField { (textField) in // можем как угодно называть эту переменную
            textField.isSecureTextEntry = true
        }
        
        alertController.addAction(action) // добавляем созданный action в алерте
        self.present(alertController, animated: true, completion: nil)
    }
    
}

