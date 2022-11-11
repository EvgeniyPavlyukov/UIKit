//
//  ViewController.swift
//  UITableViewController test
//
//  Created by Eвгений Павлюков on 30.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let tableViewController = UITableViewController(style: .plain)
    var refresh = UIRefreshControl()
    
    var items = ["Jack", "Sparrow", "Captain"]
    var cellIdentifier = "Pirate"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.refresh.tintColor = .blue
        createTableView()
        
        self.view.addSubview(tableViewController.tableView)
        tableViewController.tableView.addSubview(refresh)
    
    }
    
    @objc func handleRefresh() {
        items.append("Bang")
        refresh.endRefreshing()
        let indexPathNewRow = IndexPath(row: items.count - 1, section: 0)
        tableViewController.tableView.insertRows(at: [indexPathNewRow], with: .automatic)
        
    }

    func createTableView() {
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableViewController.tableView.frame = view.bounds
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let item = items[indexPath.row]
        var cellProperties = cell.defaultContentConfiguration()
        cellProperties.text = item
        cell.contentConfiguration = cellProperties
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
