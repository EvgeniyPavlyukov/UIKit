//
//  ViewController.swift
//  UIProgressView
//
//  Created by Eвгений Павлюков on 13.09.2022.
//

import UIKit

final class ViewController: UIViewController { //final от него нельзя будет наследоваться будет быстрее компилиться
    
    private var myProgressView = UIProgressView() // создаем экземпляр ДженEрик класса неинициализированный
    private var myButton = UIButton()
    private var myTime = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createProgress(myProgressView)
        createButton(myButton)
        myButton.addTarget(self, action: #selector(createTimer), for: .touchUpInside)
    }

    //MARK: - Timer
    
    @objc func createTimer() { // селекторы нельзя инкапсулировать приватно
        myTime = Timer.scheduledTimer(timeInterval: 1,
                                      target: self, //где? во вью контроллере
                                      selector: #selector(updateProgressView), //указатель
                                      userInfo: nil, // никаких словарей
                                      repeats: true) // без остановки нет ни начала ни конца
        
        
    }
    
    //MARK: - Selector
    
    @objc func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.1
            myButton.isHighlighted = true
            myButton.alpha = 0.2
            myButton.setTitle("Loading...", for: .highlighted)
        } else if myProgressView.progress == 1.0  {
            myButton.isHighlighted = false
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1.0
                self.myTime.invalidate()
                self.myProgressView.progress = 0
                
            }
        }
    }
    

    //MARK: - UI
    private func createProgress(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x,
                                    y: view.center.y,
                                    width: 150,
                                    height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = UIColor.green
        progressView.trackTintColor = UIColor.gray
        progressView.center = view.center
        view.addSubview(progressView)
    }
    
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.center.x, y: view.center.y + 100, width: 150, height: 50)
        button.center.x = view.center.x
        button.backgroundColor = UIColor.red
        myButton.setTitle("Start!", for: .normal)
        
        
        
        
        
        
        view.addSubview(button)
        
    }
}

