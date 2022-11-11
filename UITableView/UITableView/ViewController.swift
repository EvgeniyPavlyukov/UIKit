//
//  ViewController.swift
//  UITableView
//
//  Created by Eвгений Павлюков on 16.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    var myTableView = UITableView()
    let identifier = "My cell"
    var array = ["1","2","3","4","5","6","7","8","9"] //90% приложений состоят из таблицы

    override func viewDidLoad() {
        super.viewDidLoad()
       
        createTable()
    }
    
    func createTable() {
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        myTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        myTableView.separatorColor = .black
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(myTableView)
    }

    
    //MARK: -  UITableViewDataSource
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //создали секции
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //создаем саму ячейку
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) // зазубрить
        
        cell.textLabel?.text = "sections = \(indexPath.section) cell = \(indexPath.row)" //текст ячейки
        cell.accessoryType = .detailButton
        
        let number = array[indexPath.row]
        
        cell.textLabel?.text = number
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = array[indexPath.row]
        print(number)

    }
    
    
}

